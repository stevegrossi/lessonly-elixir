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
end
