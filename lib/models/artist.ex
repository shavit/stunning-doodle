defmodule GeniusApi.Artist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :uid
    field :name
    field :picture, :string, default: ""
    field :created, Ecto.DateTime, default: Ecto.DateTime.utc
  end

   @required_fields ~w(uid name)
   @optional_fields ~w(picture)

   def changeset(struct, params \\ %{}) do
     struct
      |> cast(params, @required_fields, @optional_fields)
   end
end
