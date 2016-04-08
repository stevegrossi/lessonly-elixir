defmodule Lessonly.Course do
  alias Lessonly.Client

  def all(client) do
    Client.get(client, "/courses")["courses"]
  end

  def find(client, id) do
    Client.get(client, "/courses/#{id}")
  end

  def assignments(client, id) do
    Client.get(client, "/courses/#{id}/assignments")
  end

  def assign(client, id, assignments) do
    Client.post(client, "/courses/#{id}/assignments", assignments)
  end
end
