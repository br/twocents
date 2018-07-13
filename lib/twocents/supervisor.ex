defmodule Twocents.Supervisor do
  @moduledoc """
  TwoCents Supervisor
  """
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      {DynamicSupervisor, name: Twocents.BucketSupervisor, strategy: :one_for_one},
      {Twocents.Registry, name: Twocents.Registry}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
