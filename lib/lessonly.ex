defmodule Lessonly do
  @moduledoc """
  The base Lessonly module, responsible for executing HTTP requests.
  """

  use HTTPoison.Base

  @user_agent {"User-agent", "lessonly-elixir"}
  @content_type {"Content-Type", "application/json"}

  @doc """
  Checks if the API is available.

  Returns `"pong"`.

  ## Examples

      > client = Lessonly.Client.new(my_subdomain, my_api_key)
      > Lessonly.ping(client)
      "pong"

  """
  def ping(client) do
    get(client, "/ping")["response"]
  end

  def get(client, endpoint) do
    get!(url(endpoint, client), headers(client))
    |> decode_response
  end

  def post(client, endpoint, data) do
    post!(url(endpoint, client), data, headers(client))
    |> decode_response
  end

  def put(client, endpoint, data) do
    put!(url(endpoint, client), data, headers(client))
    |> decode_response
  end

  def delete(client, endpoint) do
    delete!(url(endpoint, client), headers(client))
    |> decode_response
  end

  defp url(endpoint, client) do
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

  defp decode_response(response) do
    Poison.decode!(response.body)
  end
end
