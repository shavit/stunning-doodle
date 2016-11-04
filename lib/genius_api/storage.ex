defmodule GeniusApi.Storage do

  import Ecto.Query
  # alias GeniusApi.Repo

  def artist_exists(artist_name) do
    artist_name
  end

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
