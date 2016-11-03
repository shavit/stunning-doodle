defmodule GeniusApiTest do
  use ExUnit.Case
  doctest GeniusApi

  def params do
    %{
      "q" => "xo"
    }
  end

  @doc """
  Build a URL to the API endpoint with params
  """
  test "should build a URL" do
    assert GeniusApi.build_url('/', params) != None
  end
end
