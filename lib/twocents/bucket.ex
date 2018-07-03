#RESPONSIBLE FOR STORING KEY-VALUE ENTRIES
#ALLOWS THEM TO BE READ/MODIFIED BY OTHER PROCESSES
defmodule Twocents.Bucket do
  use Agent, restart: :temporary
  #use GenServer
  @doc """
  Starts a new bucket.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`.
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes `key` from `bucket`.
  Returns the current value of `key`, if `key` exists.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn dict ->
      Map.pop(dict, key)
    end)
    #EVERYTHING INSIDE FUNCTION PASSED TO AGENT HAPPENS IN AGENT PROCESS
    #AGENT PROCESS IS THE SERVER
    #EVERYTHING OUTSIDE FUNCTION HAPPENING IN CLIENT
  end

  #Lists all nodes and replies within specified server
#  def list_all(bucket) do
#    GenServer.multi_call(bucket, :pop)
#  end

end
