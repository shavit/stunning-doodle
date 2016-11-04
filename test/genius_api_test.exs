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

  @doc """
  Search the api for an artist.
  Currently it receive 505 because lack of support of the HTTP/1.1 protocol
  """
  test "should search for a term in the API" do
    assert GeniusApi.search("Michael Jackson") != None
  end

  @doc """
  Find an artist using the API.
  Execute a command and read the response via stdout
  """
  test "should search for an artist" do
    assert GeniusApi.artist_search("Michael Jackson") != None
  end

  @doc """
  Load artist data from the API
  """
  test "should load data about an artist from the API" do
    assert GeniusApi.artist_load("130") != None
  end

  @doc """
  Load artist songs from the API
  """
  test "should load songs of an artist from the API" do
    assert GeniusApi.artist_songs("130") != None
  end
end
