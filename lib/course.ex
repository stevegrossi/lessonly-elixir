defmodule Lessonly.Course do

  def all(client) do
    Lessonly.get(client, "/courses").body["courses"]
  end

  def find(client, id) do
    Lessonly.get(client, "/courses/#{id}").body
  end

  def assignments(client, id) do
    Lessonly.get(client, "/courses/#{id}/assignments").body
  end

  def assign(client, id, assignments) do
    Lessonly.post(client, "/courses/#{id}/assignments", assignments).body
  end
end
