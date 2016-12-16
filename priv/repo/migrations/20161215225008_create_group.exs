defmodule PickyBeardApi.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :members, references(:users)
      
      timestamps()
    end

  end
end
