defmodule UserTest do
  use Lessonly.ApiTest

  test "all" do
    use_cassette "user.all" do
      response = Lessonly.User.all(client)
      assert response == [
        %{"email" => "test4@lesson.ly", "ext_uid" => nil, "id" => 544550, "name" => "Test User 4", "resource_type" => "user", "role" => "learner"},
        %{"email" => "test3@lesson.ly", "ext_uid" => nil, "id" => 544549, "name" => "Test User 3", "resource_type" => "user", "role" => "creator"},
        %{"email" => "test2@lesson.ly", "ext_uid" => nil, "id" => 544548, "name" => "Test User 2", "resource_type" => "user", "role" => "manager"},
        %{"email" => "test1@lesson.ly", "ext_uid" => nil, "id" => 544547, "name" => "Test User 1", "resource_type" => "user", "role" => "admin"}
      ]
    end
  end

  test "find" do
    use_cassette "user.find" do
      response = client |> Lessonly.User.find(544547)
      assert response == %{
        "custom_user_field_data" => [],
        "email" => "test1@lesson.ly",
        "ext_uid" => nil,
        "id" => 544547,
        "name" => "Test User 1",
        "resource_type" => "user",
        "role" => "admin",
        "type" => "user"
      }
    end
  end

  test "create" do
    use_cassette "user.create" do
      response = client |> Lessonly.User.create(%{
        "name" => "Test User 5",
        "email" => "test5@lesson.ly",
        "role" => "learner"
      })

      assert response == %{
        "custom_user_field_data" => [],
        "email" => "test5@lesson.ly",
        "ext_uid" => nil,
        "id" => 544551,
        "name" => "Test User 5",
        "resource_type" => "user",
        "role" => "learner",
        "type" => "create_user"
      }
    end
  end

  test "update" do
    use_cassette "user.update" do
      response = client |> Lessonly.User.update(544551, %{"role" => "creator"})

      assert response == %{
        "custom_user_field_data" => [],
        "email" => "test5@lesson.ly",
        "ext_uid" => nil,
        "id" => 544551,
        "name" => "Test User 5",
        "resource_type" => "user",
        "role" => "creator",
        "type" => "update_user"
      }
    end
  end

  test "delete" do
    use_cassette "user.delete" do
      response = client |> Lessonly.User.delete(544551)

      assert response == %{
        "id" => 544551,
        "type" => "delete_user"
      }
    end
  end

  test "groups" do
    use_cassette "user.groups" do
      response = client |> Lessonly.User.groups(544547)

      assert response == %{
        "managing" => [],
        "memberships" => [
          %{"id" => 9539, "name" => "Test Group 1"}
        ],
       "type" => "user_groups"
      }
    end
  end

  test "update_groups" do
    use_cassette "user.update_groups" do
      response = client |> Lessonly.User.update_groups(
        544547,
        %{
          "memberships" => [
            %{"id" => 9540}
          ]
        }
      )

      assert response == %{
        "managing" => [],
        "memberships" => [
          %{"id" => 9540, "name" => "Test Group 2"},
          %{"id" => 9539, "name" => "Test Group 1"}
        ],
       "type" => "update_user_groups"
      }
    end
  end
end
