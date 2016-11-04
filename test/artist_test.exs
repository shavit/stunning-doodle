defmodule GeniusApiTest do
  use ExUnit.Case
  doctest GeniusApi

  test "should load an artist" do
    assert GeniusApi.Storage.artist_exists("130") != None
  end
end
