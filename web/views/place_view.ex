defmodule PickyBeardApi.PlaceView do
  use PickyBeardApi.Web, :view

  def render("index.json", %{place: place}) do
    %{data: render_many(place, PickyBeardApi.PlaceView, "place.json")}
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, PickyBeardApi.PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    %{id: place.id,
      name: place.name,
      price: place.price,
      location: place.location,
      cuisene: place.cuisene}
  end
end
