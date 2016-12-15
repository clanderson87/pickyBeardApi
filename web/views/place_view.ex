defmodule PickyBeardApi.PlaceView do
  use PickyBeardApi.Web, :view

  def render("index.json", %{Place: Place}) do
    %{data: render_many(Place, PickyBeardApi.PlaceView, "Place.json")}
  end

  def render("show.json", %{Place: Place}) do
    %{data: render_one(Place, PickyBeardApi.PlaceView, "Place.json")}
  end

  def render("Place.json", %{Place: Place}) do
    %{id: Place.id,
      name: Place.name,
      price: Place.price,
      location: Place.location,
      cuisene: Place.cuisene}
  end
end
