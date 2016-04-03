defmodule Lessonly do
  use HTTPoison.Base

  @user_agent {"User-agent", "lessonly-elixir"}
  @content_type {"Content-Type", "application/json"}

  def ping(client) do
    get(client, "/ping").body["response"]
  end

  def get(client, endpoint) do
    get!(construct_url(endpoint, client), headers(client))
  end

  def post(client, endpoint, data) do
    post!(construct_url(endpoint, client), data, headers(client))
  end

  def put(client, endpoint, data) do
    put!(construct_url(endpoint, client), data, headers(client))
  end

  def delete(client, endpoint) do
    delete!(construct_url(endpoint, client), headers(client))
  end

  defp construct_url(endpoint, client) do
    client.base_url <> endpoint
  end

  defp headers(client) do
    [
      @user_agent,
      @content_type,
      authorization_header(client)
    ]
  end

  defp authorization_header(client) do
    {"Authorization", "Basic #{client.encoded_auth}"}
  end

  defp process_request_body(body), do: Poison.encode!(body)
  defp process_response_body(body), do: Poison.decode!(body)
end
