defmodule PickyBeardApi.Router do
  use PickyBeardApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PickyBeardApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", PickyBeardApi do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/groups", GroupController, except: [:new, :edit]
    resources "/places", PlaceController, except: [:new, :edit]
  end
end
