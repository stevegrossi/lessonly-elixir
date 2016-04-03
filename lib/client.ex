defmodule Lessonly.Client do
  defstruct [:encoded_auth, :base_url]

  def new(subdomain, api_key, base_url \\ "https://api.lesson.ly/api/v1") do
    %__MODULE__{
      encoded_auth: :base64.encode("#{subdomain}:#{api_key}"),
      base_url: base_url
    }
  end
end
