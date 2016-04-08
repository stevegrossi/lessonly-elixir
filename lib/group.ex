defmodule Lessonly.Group do
  alias Lessonly.Client

  def all(client) do
    Client.get(client, "/groups")["groups"]
  end

  def find(client, id) do
    Client.get(client, "/groups/#{id}")
  end

  def create(client, attributes) do
    Client.post(client, "/groups", attributes)
  end

  def update(client, id, attributes) do
    Client.put(client, "/groups/#{id}", attributes)
  end
end
