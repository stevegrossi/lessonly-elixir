defmodule Lessonly.Lesson do

  def all(client) do
    Lessonly.get(client, "/lessons")["lessons"]
  end

  def find(client, id) do
    Lessonly.get(client, "/lessons/#{id}")
  end

  def update(client, id, attributes) do
    Lessonly.put(client, "/lessons/#{id}", attributes)
  end

  def assignments(client, id) do
    Lessonly.get(client, "/lessons/#{id}/assignments")
  end

  def assign(client, id, assignments) do
    Lessonly.post(client, "/lessons/#{id}/assignments", assignments)
  end
end
