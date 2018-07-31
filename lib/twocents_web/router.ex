defmodule TwocentsWeb.Router do
  use TwocentsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "html"]
  end

  scope "/", TwocentsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/up", UpController, :index
  end

  # Other scopes may use custom stacks.
   scope "/test", TwocentsWeb do
     pipe_through :api
     resources "/polls", PollController
     post "/polls", PollController, :create
     put "/polls", PollController, :update
   end
end
