defmodule GroupTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  defp client do
    Lessonly.Client.new(
      "test",
      "t5tNqaykVwN3Hk1VXXNLOKG6snTMnU8U",
      "http://api.lvh.me:3000/api/v1"
    )
  end

  test "all" do
    use_cassette "group.all" do
      response = Lessonly.Group.all(client)
      assert response == [
        %{"id" => 9539, "name" => "Test Group 1"},
        %{"id" => 9538, "name" => "Group::Everyone"}
      ]
    end
  end

  test "find" do
    use_cassette "group.find" do
      response = client |> Lessonly.Group.find(9539)
      assert response == %{
        "id" => 9539,
        "managers" => [],
        "members" => [
          %{"email" => "test1@lesson.ly", "ext_uid" => nil, "id" => 544547, "name" => "Test User 1", "resource_type" => "user", "role" => "admin"}
        ],
        "name" => "Test Group 1",
        "resource_type" => "group",
        "type" => "group"
      }
    end
  end
end
