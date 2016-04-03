defmodule LessonlyTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  defp client do
    Lessonly.Client.new(
      "test",
      "t5tNqaykVwN3Hk1VXXNLOKG6snTMnU8U",
      "http://api.lvh.me:3000/api/v1"
    )
  end

  test "ping" do
    use_cassette "ping" do
      response = Lessonly.ping(client)
      assert response == "pong"
    end
  end
end
