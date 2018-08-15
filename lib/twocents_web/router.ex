defmodule TwocentsWeb.Router do
  use TwocentsWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
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
    # UP-CHECK
    get "/up", UpController, :index
  end

  # Other scopes may use custom stacks.
   scope "/test", TwocentsWeb do
     pipe_through :api
     # Shows whole database and individual polls ( test/polls/${poll_id} )
     resources "/polls", PollController
     # Add a new poll to the database
     post "/polls", PollController, :create
     # Increment vote for choice in a poll
     put "/polls", PollController, :update
   end
end
