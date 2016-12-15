defmodule PickyBeardApi.PlaceControllerTest do
  use PickyBeardApi.ConnCase

  alias PickyBeardApi.Place
  @valid_attrs %{cuisene: "some content", location: "some content", name: "some content", price: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, Place_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    Place = Repo.insert! %Place{}
    conn = get conn, Place_path(conn, :show, Place)
    assert json_response(conn, 200)["data"] == %{"id" => Place.id,
      "name" => Place.name,
      "price" => Place.price,
      "location" => Place.location,
      "cuisene" => Place.cuisene}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, Place_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, Place_path(conn, :create), Place: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Place, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, Place_path(conn, :create), Place: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    Place = Repo.insert! %Place{}
    conn = put conn, Place_path(conn, :update, Place), Place: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Place, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    Place = Repo.insert! %Place{}
    conn = put conn, Place_path(conn, :update, Place), Place: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    Place = Repo.insert! %Place{}
    conn = delete conn, Place_path(conn, :delete, Place)
    assert response(conn, 204)
    refute Repo.get(Place, Place.id)
  end
end
