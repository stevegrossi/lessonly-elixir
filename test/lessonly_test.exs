defmodule LessonlyTest do
  use Lessonly.ApiTest

  test "ping" do
    use_cassette "ping" do
      response = Lessonly.ping(client)
      assert response == "pong"
    end
  end
end
