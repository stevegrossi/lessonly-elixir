defmodule Lessonly.Lesson do
  use HTTPoison.Base

  def all(client) do
    Lessonly.get(client, "/lessons").body["lessons"]
  end

  def find(client, id) do
    Lessonly.get(client, "/lessons/#{id}").body
  end

  def update(client, id, attributes) do
    Lessonly.put(client, "/lessons/#{id}", attributes).body
  end

  def assignments(client, id) do
    Lessonly.get(client, "/lessons/#{id}/assignments").body
  end

  def assign(client, id, assignments) do
    Lessonly.post(client, "/lessons/#{id}/assignments", assignments).body
  end
end
