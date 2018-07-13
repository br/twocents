defmodule Twocents.PollChannel do
  @moduledoc """
  TwoCents PollChannel
  """
  use Phoenix.Channel

  def join("polls:" <> poll_id, _params, socket) do
    {:ok, socket}
  end
end
