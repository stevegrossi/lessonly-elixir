defmodule GroupTest do
  use Lessonly.ApiTest

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
