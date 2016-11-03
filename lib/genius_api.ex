defmodule GeniusApi do

  defp access_token do
    :os.getenv("GENIUS_ACCESS_TOKEN")
  end

  def build_url(endpoint, params) do
    ['https://api.genius.com',
      endpoint,
      Enum.map(params, fn({k,v}) ->
          "&"<>k<>"="<>v
        end)
        |> List.to_string
    ]
      |> List.to_string
      |> String.to_charlist
  end

  defp headers do
    [{'User-Agent', 'ShavitTzuriel (https://github.com/shavit/stunning-doodle)'},
      {'Authorization', 'Bearer ' ++ access_token},
      {'Accept', 'application/json'}
    ]
  end

  defp request(endpoint, param_map) do
    :inets.start
    :ssl.start
    :httpc.request(:get,
      {build_url(endpoint, param_map), headers},
      [],
      [])
  end

  def search(term) do
    # :edoc_lib.escape_uri(term)
    request("/search?", %{"q" => term})
  end
end
