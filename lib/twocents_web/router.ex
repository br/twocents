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
    plug :accepts, ["json"]
  end

  scope "/", TwocentsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/up", UpController, :index
    #resources "/polls", PollController
  end

  # Other scopes may use custom stacks.
   scope "/test", TwocentsWeb do
     pipe_through :api
     resources "/polls", PollController
     # get "/polls", PollController, :index
     # get "/polls/:id", PollController, :show
     # post "/polls", PollController, :create #to save new polls to db
     # put "/polls", PollController, :update #to increment poll votes
   end
end
