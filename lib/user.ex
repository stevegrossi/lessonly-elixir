defmodule Lessonly.User do
  use HTTPoison.Base

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
end
