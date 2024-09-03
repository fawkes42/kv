defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link()
    %{bucket: bucket}
  end

  test "store values by key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "answer", 42)
    assert KV.Bucket.put(bucket, "answer", 42) == :ok
  end

  test "retrieve values by key", %{bucket: bucket} do
    KV.Bucket.put(bucket, "answer", 42)
    assert KV.Bucket.get(bucket, "answer") == 42
  end

  test "return nil when key is not found", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "answer") == nil
  end

  test "should delete an item by key and return the removed value", %{bucket: bucket} do
    KV.Bucket.put(bucket, "answer", 42)
    assert KV.Bucket.delete(bucket, "answer") == 42
  end
end
