defmodule PickyBeardApi.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do

      timestamps()
    end

  end
end
