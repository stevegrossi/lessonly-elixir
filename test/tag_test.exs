defmodule TagTest do
  use Lessonly.ApiTest

  test "all" do
    use_cassette "tag.all" do
      response = Lessonly.Tag.all(client)
      assert response == [
        %{"id" => 20365, "name" => "Customer Support", "resource_type" => "tag"},
        %{"id" => 20366, "name" => "Draft", "resource_type" => "tag"},
        %{"id" => 20367, "name" => "HR", "resource_type" => "tag"},
        %{"id" => 20368, "name" => "Marketing", "resource_type" => "tag"},
        %{"id" => 20369, "name" => "Sales", "resource_type" => "tag"}
      ]
    end
  end

  test "find" do
    use_cassette "tag.find" do
      response = client |> Lessonly.Tag.find(20367)
      assert response == %{
        "id" => 20367,
        "name" => "HR",
        "resource_type" => "tag",
        "type" => "tag"
      }
    end
  end
end
