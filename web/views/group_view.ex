defmodule PickyBeardApi.GroupView do
  use PickyBeardApi.Web, :view

  def render("index.json", %{groups: groups}) do
    %{data: render_many(groups, PickyBeardApi.GroupView, "group.json")}
  end

  def render("show.json", %{group: group}) do
    %{data: render_one(group, PickyBeardApi.GroupView, "group.json")}
  end

  def render("group.json", %{group: group}) do
    %{id: group.id}
  end
end
