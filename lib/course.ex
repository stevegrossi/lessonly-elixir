defmodule Lessonly.Course do
  use HTTPoison.Base

  def all(client) do
    Lessonly.get(client, "/courses").body["courses"]
  end

  def find(client, id) do
    Lessonly.get(client, "/courses/#{id}").body
  end
end
