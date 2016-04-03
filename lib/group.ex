defmodule Lessonly.Group do
  use HTTPoison.Base

  def all(client) do
    Lessonly.get(client, "/groups").body["groups"]
  end

  def find(client, id) do
    Lessonly.get(client, "/groups/#{id}").body
  end
end
