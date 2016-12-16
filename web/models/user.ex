defmodule PickyBeardApi.User do
  use PickyBeardApi.Web, :model

  schema "users" do
    field :name, :string
    field :provider, :string
    field :token, :string
    many_to_many :groups, PickyBeardApi.Group, join_through: "group_id"
    has_many :favorites, PickyBeardApi.Place

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :provider, :token])
    |> validate_required([:name, :provider, :token])
  end
end
