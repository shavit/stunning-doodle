defmodule GeniusApi do

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(GeniusApi.Repo, []),
      # Start the endpoint when the application starts
      # supervisor(GeniusApi.Endpoint, []),
      # Start your own worker by calling: GeniusApi.Worker.start_link(arg1, arg2, arg3)
      # worker(GeniusApi.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GeniusApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

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

  def artist_search(name) do
    url = build_url("/search?", %{"q" => name})
    System.cmd(System.cwd<>"/bin/api", [url])
  end

  def artist_load(id) do
    url = build_url("/artists/#{id}", %{})
    {res_data, status} = System.cmd(System.cwd<>"/bin/api", [url])
    {:ok, artist_data} = JSX.decode(res_data)

    GeniusApi.Writer.write_result(artist_data, System.cwd<>"/tmp/artist-#{id}.json")

    artist = artist_data["response"]["artist"]
  end

  def artist_songs(id, page \\ "1") do
    url = build_url("/artists/#{id}/songs?", %{"per_page" => "50", "page" => page})
    {res_data, status} = System.cmd(System.cwd<>"/bin/api", [url])
    {:ok, songs_data} = JSX.decode(res_data)

    # GeniusApi.Writer.write_result(songs_data, System.cwd<>"/tmp/artist-#{id}-songs.json")

    songs_data
  end
end
