defmodule PickyBeardApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :provider, :string
      add :token, :string
      add :groups, references(:groups)
      add :favorites, references(:places)

      timestamps()
    end

  end
end
