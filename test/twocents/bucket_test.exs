defmodule Twocents.BucketTest do
  use ExUnit.Case, async: true

  setup do
      {:ok, bucket} = Twocents.Bucket.start_link([])
      bucket = start_supervised!(Twocents.Bucket)
      %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
        assert Twocents.Bucket.get(bucket, "messi") == nil

        Twocents.Bucket.put(bucket, "messi", 3)
        assert Twocents.Bucket.get(bucket, "messi") == 3
  end

  test "updates values by key", %{bucket: bucket} do
        assert Twocents.Bucket.get(bucket, "messi") == nil
        assert Twocents.Bucket.get(bucket, "ronaldo") == nil

        Twocents.Bucket.put(bucket, "messi", 3)
        Twocents.Bucket.put(bucket, "ronaldo", 3)

        assert Twocents.Bucket.get(bucket, "messi") == 3
        assert Twocents.Bucket.get(bucket, "ronaldo") == 3

        Twocents.Bucket.put(bucket, "messi", 4)
        Twocents.Bucket.put(bucket, "ronaldo", 4)

        assert Twocents.Bucket.get(bucket, "messi") == 4
        assert Twocents.Bucket.get(bucket, "ronaldo") == 4
  end

  test "delete key from bucket", %{bucket: bucket} do
        assert Twocents.Bucket.delete(bucket, "messi") == nil
  end

  test "are temporary workers" do
        assert Supervisor.child_spec(Twocents.Bucket, []).restart == :temporary
  end
end
