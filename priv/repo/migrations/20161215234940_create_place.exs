defmodule PickyBeardApi.Repo.Migrations.CreatePlace do
  use Ecto.Migration

  def change do
    create table(:place) do
      add :name, :string
      add :price, :string
      add :location, :string
      add :cuisene, :string
      add :fans, references(:users)

      timestamps()
    end

  end
end
