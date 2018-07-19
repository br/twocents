defmodule TwocentsWeb.UpController do
  use TwocentsWeb, :controller
  alias Twocents.{Up} #Repo,

  def index(conn, _) do
   response = %{
     operational: true
   }

   json(conn, response)
 end
end
