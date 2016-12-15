defmodule PickyBeardApi.Repo.Migrations.CreatePlace do
  use Ecto.Migration

  def change do
    create table(:Place) do
      add :name, :string
      add :price, :string
      add :location, :string
      add :cuisene, :string

      timestamps()
    end

  end
end
