defmodule Lessonly.User do

  def all(client) do
    Lessonly.get(client, "/users")["users"]
  end

  def find(client, id) do
    Lessonly.get(client, "/users/#{id}")
  end

  def create(client, attributes) do
    Lessonly.post(client, "/users", attributes)
  end

  def update(client, id, attributes) do
    Lessonly.put(client, "/users/#{id}", attributes)
  end

  def delete(client, id) do
    Lessonly.delete(client, "/users/#{id}")
  end

  def groups(client, id) do
    Lessonly.get(client, "/users/#{id}/groups")
  end

  def update_groups(client, id, attributes) do
    Lessonly.put(client, "/users/#{id}/groups", attributes)
  end

  def assignments(client, id) do
    Lessonly.get(client, "/users/#{id}/assignments")
  end

  def assign(client, id, assignments) do
    Lessonly.post(client, "/users/#{id}/assignments", assignments)
  end
end
