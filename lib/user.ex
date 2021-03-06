defmodule Lessonly.User do
  alias Lessonly.Client

  def all(client) do
    Client.get(client, "/users")["users"]
  end

  def find(client, id) do
    Client.get(client, "/users/#{id}")
  end

  def create(client, attributes) do
    Client.post(client, "/users", attributes)
  end

  def update(client, id, attributes) do
    Client.put(client, "/users/#{id}", attributes)
  end

  def delete(client, id) do
    Client.delete(client, "/users/#{id}")
  end

  def groups(client, id) do
    Client.get(client, "/users/#{id}/groups")
  end

  def update_groups(client, id, attributes) do
    Client.put(client, "/users/#{id}/groups", attributes)
  end

  def assignments(client, id) do
    Client.get(client, "/users/#{id}/assignments")
  end

  def assign(client, id, assignments) do
    Client.post(client, "/users/#{id}/assignments", assignments)
  end
end
