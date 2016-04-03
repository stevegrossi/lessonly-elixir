defmodule Lessonly do
  use HTTPoison.Base

  @user_agent {"User-agent", "lessonly-elixir"}

  def ping(client) do
    get(client, "/ping").body["response"]
  end

  def get(client, endpoint) do
    get!(construct_url(endpoint, client), headers(client))
  end

  defp construct_url(endpoint, client) do
    client.base_url <> endpoint
  end

  defp headers(client) do
    [
      @user_agent,
      authorization_header(client)
    ]
  end

  defp authorization_header(client) do
    {"Authorization", "Basic #{client.encoded_auth}"}
  end

  defp process_response_body(body), do: Poison.decode!(body)
end
