defmodule Lessonly.Tag do
  alias Lessonly.Client

  def all(client) do
    Client.get(client, "/tags")["tags"]
  end

  def find(client, id) do
    Client.get(client, "/tags/#{id}")
  end
end
