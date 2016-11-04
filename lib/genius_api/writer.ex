defmodule GeniusApi.Writer do

  def write_result(data, new_file_path) do
    {:ok, f} = File.open new_file_path, [:write]
    IO.write f, data
    File.close f
  end
end
