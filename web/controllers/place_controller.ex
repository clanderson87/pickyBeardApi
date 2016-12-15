defmodule PickyBeardApi.PlaceController do
  use PickyBeardApi.Web, :controller

  alias PickyBeardApi.Place

  def index(conn, _params) do
    Place = Repo.all(Place)
    render(conn, "index.json", Place: Place)
  end

  def create(conn, %{"Place" => Place_params}) do
    changeset = Place.changeset(%Place{}, Place_params)

    case Repo.insert(changeset) do
      {:ok, Place} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Place_path(conn, :show, Place))
        |> render("show.json", Place: Place)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PickyBeardApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    Place = Repo.get!(Place, id)
    render(conn, "show.json", Place: Place)
  end

  def update(conn, %{"id" => id, "Place" => Place_params}) do
    Place = Repo.get!(Place, id)
    changeset = Place.changeset(Place, Place_params)

    case Repo.update(changeset) do
      {:ok, Place} ->
        render(conn, "show.json", Place: Place)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PickyBeardApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    Place = Repo.get!(Place, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(Place)

    send_resp(conn, :no_content, "")
  end
end
