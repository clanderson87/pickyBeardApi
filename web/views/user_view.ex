defmodule PickyBeardApi.UserView do
  use PickyBeardApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PickyBeardApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PickyBeardApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      provider: user.provider,
      token: user.token}
  end
end
