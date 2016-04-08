defmodule ClientTest do
  use Lessonly.ApiTest
  alias Lessonly.Client

  doctest Lessonly.Client

  test "ping" do
    use_cassette "ping" do
      assert Client.ping(client) == "pong"
    end
  end
end
