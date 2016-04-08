defmodule Lessonly.Client do
  @moduledoc """
  The Lessonly.Client module is responsible for making the actual HTTP requests.
  It also builds a struct to hold the API user’s credentials, and allows
  overriding the default base URL where the API can be found.

  In normal usage, it should not be necessary to override the base_url,
  but in building and testing this package, I found it useful to access
  a test version of the Lesson.ly API so as not to make changes to actual
  records when initially running the tests and recording the ExVCR responses.
  """

  use HTTPoison.Base

  defstruct [:encoded_auth, :base_url]

  @base_url "https://api.lesson.ly/api/v1"

  @doc """
  Instantiates a client capable of making API requests. Optionally accepts a
  `base_url` to change the URL for the Lesson.ly API.

  Returns a `%Lessonly.Client{}` struct.

  ## Examples

      iex> Lessonly.Client.new("my_subdomain", "my_api_key")
      %Lessonly.Client{
        base_url: "https://api.lesson.ly/api/v1",
        encoded_auth: "bXlfc3ViZG9tYWluOm15X2FwaV9rZXk="
      }

      iex> Lessonly.Client.new("my_subdomain", "my_api_key", "http://localhost")
      %Lessonly.Client{
        base_url: "http://localhost",
        encoded_auth: "bXlfc3ViZG9tYWluOm15X2FwaV9rZXk="
      }

  """
  def new(subdomain, api_key, base_url \\ @base_url) do
    %__MODULE__{
      encoded_auth: :base64.encode("#{subdomain}:#{api_key}"),
      base_url: base_url
    }
  end

  @doc """
  Checks if the API is available.

  Returns `"pong"`.

  ## Examples

      > client = Lessonly.Client.new(my_subdomain, my_api_key)
      > Lessonly.Client.ping(client)
      "pong"

  """
  def ping(client) do
    get(client, "/ping")["response"]
  end

  @doc """
  Performs an HTTP GET request on behalf of a client.

  ## Examples

      > client = Lessonly.Client.new(my_subdomain, my_api_key)
      > Lessonly.Client.get(client, "/users")

  """
  def get(client, endpoint) do
    get!(url(endpoint, client), headers(client))
    |> decode_response
  end

  @doc """
  Performs an HTTP POST request on behalf of a client.

  ## Examples

      > client = Lessonly.Client.new(my_subdomain, my_api_key)
      > new_user_data = %{ "name" => "Steve" }
      > Lessonly.Client.post(client, "/users", new_user_data)

  """
  def post(client, endpoint, data) do
    post!(url(endpoint, client), data, headers(client))
    |> decode_response
  end

  @doc """
  Performs an HTTP PUT request on behalf of a client.

  ## Examples

      > client = Lessonly.Client.new(my_subdomain, my_api_key)
      > data = %{ "name" => "Jane" }
      > Lessonly.Client.put(client, "/users/1", data)

  """
  def put(client, endpoint, data) do
    put!(url(endpoint, client), data, headers(client))
    |> decode_response
  end

  @doc """
  Performs an HTTP DELETE request on behalf of a client.

  ## Examples

      > client = Lessonly.Client.new(my_subdomain, my_api_key)
      > Lessonly.Client.delete(client, "/users/1")

  """
  def delete(client, endpoint) do
    delete!(url(endpoint, client), headers(client))
    |> decode_response
  end


  defp url(endpoint, client) do
    client.base_url <> endpoint
  end

  defp headers(client) do
    [
      {"User-agent", "lessonly-elixir"},
      {"Content-Type", "application/json"},
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
