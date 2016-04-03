defmodule Lessonly.Group do

  def all(client) do
    Lessonly.get(client, "/groups").body["groups"]
  end

  def find(client, id) do
    Lessonly.get(client, "/groups/#{id}").body
  end

  def create(client, attributes) do
    Lessonly.post(client, "/groups", attributes).body
  end

  def update(client, id, attributes) do
    Lessonly.put(client, "/groups/#{id}", attributes).body
  end
end
