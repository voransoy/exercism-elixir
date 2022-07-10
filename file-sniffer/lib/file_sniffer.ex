defmodule FileSniffer do
  @extensions %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  @signatures %{
    "application/octet-stream" => <<0x7F, 0x45, 0x4C, 0x46>>,
    "image/bmp" => <<0x42, 0x4D>>,
    "image/png" => <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>,
    "image/jpg" => <<0xFF, 0xD8, 0xFF>>,
    "image/gif" => <<0x47, 0x49, 0x46>>
  }

  def type_from_extension(extension) do
    @extensions[extension]
  end

  def type_from_binary(file_binary) do
    # Please implement the type_from_binary/1 function
    Enum.find_value(@signatures, fn {x, y} ->
      length = byte_size(y)
      <<header::binary-size(length), _::binary>> = file_binary
      if header == y, do: x, else: nil
    end)
  end

  def verify(file_binary, extension) do
    # Please implement the verify/2 function
    if type_from_extension(extension) == type_from_binary(file_binary) do
      {:ok, type_from_extension(extension)}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
