defmodule Lessonly.Tag do

  def all(client) do
    Lessonly.get(client, "/tags").body["tags"]
  end

  def find(client, id) do
    Lessonly.get(client, "/tags/#{id}").body
  end
end
