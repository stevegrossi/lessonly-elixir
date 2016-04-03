defmodule Lessonly.Tag do
  use HTTPoison.Base

  def all(client) do
    Lessonly.get(client, "/tags").body["tags"]
  end

  def find(client, id) do
    Lessonly.get(client, "/tags/#{id}").body
  end
end
