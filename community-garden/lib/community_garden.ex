# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []) do
    Agent.start(fn -> %{registrations: [], last: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn x -> x[:registrations] end)
  end

  def register(pid, register_to) do
    new_key = Agent.get(pid, fn x -> x[:last] end) + 1
    plot = %Plot{plot_id: new_key, registered_to: register_to}

    Agent.update(pid, fn x ->
      %{
        last: new_key,
        registrations: [plot | x[:registrations]]
      }
    end)

    plot
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn x ->
      Map.put(
        x,
        :registrations,
        Enum.filter(x[:registrations], fn plot ->
          plot.plot_id != plot_id
        end)
      )
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn x ->
      case Enum.find(x[:registrations], fn plot -> plot.plot_id == plot_id end) do
        nil -> {:not_found, "plot is unregistered"}
        p -> p
      end
    end)
  end
end
