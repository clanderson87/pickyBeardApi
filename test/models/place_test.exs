defmodule PickyBeardApi.PlaceTest do
  use PickyBeardApi.ModelCase

  alias PickyBeardApi.Place

  @valid_attrs %{cuisene: "some content", location: "some content", name: "some content", price: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Place.changeset(%Place{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Place.changeset(%Place{}, @invalid_attrs)
    refute changeset.valid?
  end
end
