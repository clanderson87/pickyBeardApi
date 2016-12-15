defmodule PickyBeardApi.Place do
  use PickyBeardApi.Web, :model

  schema "place" do
    field :name, :string
    field :price, :string
    field :location, :string
    field :cuisene, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :price, :location, :cuisene])
    |> validate_required([:name, :price, :location, :cuisene])
  end
end
