defmodule Lessonly.User do
  use HTTPoison.Base

  def all(client) do
    Lessonly.get(client, "/users").body["users"]
  end

  def find(client, id) do
    Lessonly.get(client, "/users/#{id}").body
  end
end
