defmodule Lessonly.Client do
  @moduledoc """
  The Lessonly.Client module is responsible for building a struct to hold
  the API user’s credentials. It also holds an overrideable default base
  URL where the API can be found.

  In normal usage, it should not be necessary to override the base_url,
  but in building and testing this package, I found it useful to access
  a test version of the Lesson.ly API so as not to make changes to actual
  records when initially running the tests and recording the ExVCR responses.
  """

  defstruct [:encoded_auth, :base_url]

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
  def new(subdomain, api_key, base_url \\ "https://api.lesson.ly/api/v1") do
    %__MODULE__{
      encoded_auth: :base64.encode("#{subdomain}:#{api_key}"),
      base_url: base_url
    }
  end
end
