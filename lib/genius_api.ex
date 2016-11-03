defmodule GeniusApi do

  def build_url(endpoint, params) do
    ['https://api.genius.com',
      endpoint,
      Enum.map(params, fn({k,v}) -> "&"<>k<>"="<>v  end)
        |> List.to_string
    ]
      |> List.to_string
      |> String.to_charlist
  end

  def request(endpoint, param_map) do
    :inets.start
    :ssl.start
    :httpc.request(:get, {build_url(endpoint, param_map), []}, [], [])
  end
end
