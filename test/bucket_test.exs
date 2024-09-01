defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "store values by key" do
    {:ok, bucket} = KV.Bucket.start_link()

    KV.Bucket.put(bucket, "answer", 42)
    assert KV.Bucket.put(bucket, "answer", 42) == :ok
  end

  test "retrieve values by key" do
    {:ok, bucket} = KV.Bucket.start_link()
    KV.Bucket.put(bucket, "answer", 42)
    assert KV.Bucket.get(bucket, "answer") == 42
  end

  test "return nil when key is not found" do
    {:ok, bucket} = KV.Bucket.start_link()
    assert KV.Bucket.get(bucket, "answer") == nil
  end
end
