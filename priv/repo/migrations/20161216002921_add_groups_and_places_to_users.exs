defmodule PickyBeardApi.Repo.Migrations.AddGroupsAndPlacesToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :groups, references(:groups)
      add :favorites, references(:place)
    end
  end
end
