defmodule Lessonly.Lesson do
  use HTTPoison.Base

  def all(client) do
    Lessonly.get(client, "/lessons").body["lessons"]
  end

  def find(client, id) do
    Lessonly.get(client, "/lessons/#{id}").body
  end
end
