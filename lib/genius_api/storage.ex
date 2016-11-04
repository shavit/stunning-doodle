defmodule GeniusApi.Storage do

  import Ecto.Query
  alias GeniusApi.Repo
  alias GeniusApi.Artist

  def artist_exists(uid) do
    query = from artist in Artist,
      where: artist.uid == ^uid,
      select: artist

    Repo.all(query)
    uid
  end

  # uery = from w in Weather,
  #        where: w.prcp > 0 or is_nil(w.prcp),
  #        select: w
  #   Repo.all(query)

  @doc """

  Artist keys:

    ["alternate_names", "api_path", "current_user_metadata", "description",
   "description_annotation", "facebook_name", "followers_count",
   "header_image_url", "id", "image_url", "instagram_name", "is_meme_verified",
   "is_verified", "name", "twitter_name", "url", "user"]

  """
  def artist_save(_artist_data) do
  end
end
