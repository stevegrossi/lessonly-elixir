defmodule Lessonly.Group do

  def all(client) do
    Lessonly.get(client, "/groups")["groups"]
  end

  def find(client, id) do
    Lessonly.get(client, "/groups/#{id}")
  end

  def create(client, attributes) do
    Lessonly.post(client, "/groups", attributes)
  end

  def update(client, id, attributes) do
    Lessonly.put(client, "/groups/#{id}", attributes)
  end
end
