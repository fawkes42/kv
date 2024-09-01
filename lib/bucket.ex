defmodule KV.Bucket do
  @moduledoc """
  A simple key-value store.
  """

  @doc """
  Starts a new bucket with an empty map.
  """
  def start_link() do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets the value for a key in the bucket.

  ## Examples

      iex> KV.Bucket.get(bucket, "answer")
      nil

      OR

      iex> KV.Bucket.get(bucket, "answer")
      42
  """
  def get(bucket, key) do
    Agent.get(bucket, fn map -> Map.get(map, key) end)
  end

  @doc """
  Puts a value for a key in the bucket.

  ## Examples

      iex> KV.Bucket.put(bucket, "answer", 42)
      :ok
  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn map -> Map.put(map, key, value) end)
  end
end
