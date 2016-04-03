defmodule Lessonly.User do

  def all(client) do
    Lessonly.get(client, "/users").body["users"]
  end

  def find(client, id) do
    Lessonly.get(client, "/users/#{id}").body
  end

  def create(client, attributes) do
    Lessonly.post(client, "/users", attributes).body
  end

  def update(client, id, attributes) do
    Lessonly.put(client, "/users/#{id}", attributes).body
  end

  def delete(client, id) do
    Lessonly.delete(client, "/users/#{id}").body
  end

  def groups(client, id) do
    Lessonly.get(client, "/users/#{id}/groups").body
  end

  def update_groups(client, id, attributes) do
    Lessonly.put(client, "/users/#{id}/groups", attributes).body
  end

  def assignments(client, id) do
    Lessonly.get(client, "/users/#{id}/assignments").body
  end

  def assign(client, id, assignments) do
    Lessonly.post(client, "/users/#{id}/assignments", assignments).body
  end
end
