defmodule Lessonly.Lesson do
  alias Lessonly.Client

  def all(client) do
    Client.get(client, "/lessons")["lessons"]
  end

  def find(client, id) do
    Client.get(client, "/lessons/#{id}")
  end

  def update(client, id, attributes) do
    Client.put(client, "/lessons/#{id}", attributes)
  end

  def assignments(client, id) do
    Client.get(client, "/lessons/#{id}/assignments")
  end

  def assign(client, id, assignments) do
    Client.post(client, "/lessons/#{id}/assignments", assignments)
  end
end
