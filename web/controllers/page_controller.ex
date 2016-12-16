defmodule PickyBeardApi.PageController do
  use PickyBeardApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
