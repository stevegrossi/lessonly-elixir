defmodule Lessonly.Course do

  def all(client) do
    Lessonly.get(client, "/courses")["courses"]
  end

  def find(client, id) do
    Lessonly.get(client, "/courses/#{id}")
  end

  def assignments(client, id) do
    Lessonly.get(client, "/courses/#{id}/assignments")
  end

  def assign(client, id, assignments) do
    Lessonly.post(client, "/courses/#{id}/assignments", assignments)
  end
end
