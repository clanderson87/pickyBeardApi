defmodule PickyBeardApi.Group do
  use PickyBeardApi.Web, :model

  schema "groups" do
    has_many :members, PickyBeardApi.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
