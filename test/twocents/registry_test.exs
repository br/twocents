defmodule Twocents.RegistryTest do
  use ExUnit.Case, async: true

  setup context do
    _ = start_supervised!({Twocents.Registry, name: context.test})
    %{registry: context.test}
  end

  test "spawns buckets", %{registry: registry} do
    assert Twocents.Registry.lookup(registry, "poll") == :error

    Twocents.Registry.create(registry, "poll")
    assert {:ok, bucket} = Twocents.Registry.lookup(registry, "poll")

    Twocents.Bucket.put(bucket, "ronaldo", 1)
    assert Twocents.Bucket.get(bucket, "ronaldo") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    Twocents.Registry.create(registry, "poll")
    {:ok, bucket} = Twocents.Registry.lookup(registry, "poll")
    Agent.stop(bucket)
    # Do a call to ensure the registry processed the DOWN message
    _ = Twocents.Registry.create(registry, "bogus")
    assert Twocents.Registry.lookup(registry, "poll") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    Twocents.Registry.create(registry, "poll")
    {:ok, bucket} = Twocents.Registry.lookup(registry, "poll")

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :shutdown)

    # Do a call to ensure the registry processed the DOWN message
    _ = Twocents.Registry.create(registry, "bogus")
    assert Twocents.Registry.lookup(registry, "poll") == :error
  end
end
