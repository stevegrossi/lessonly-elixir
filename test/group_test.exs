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

  test "create" do
    use_cassette "group.create" do
      response = client |> Lessonly.Group.create(%{
        "name" => "Test Group 3"
      })

      assert response == %{
        "id" => 9541,
        "managers" => [],
        "members" => [],
        "name" => "Test Group 3",
        "resource_type" => "group",
        "type" => "create_group"
      }
    end
  end

  test "update" do
    use_cassette "group.update" do
      response = client |> Lessonly.Group.update(9541, %{"name" => "Testy Group 3"})

      assert response == %{
        "id" => 9541,
        "managers" => [],
        "members" => [],
        "name" => "Testy Group 3",
        "resource_type" => "group",
        "type" => "update_group"
      }
    end
  end
end
