defmodule LessonTest do
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
    use_cassette "lesson.all" do
      response = Lessonly.Lesson.all(client)
      assert response == [
        %{"id" => 29414, "title" => "Test Lesson 1"},
        %{"id" => 29415, "title" => "Test Lesson 2"}
      ]
    end
  end

  test "find" do
    use_cassette "lesson.find" do
      response = client |> Lessonly.Lesson.find(29415)
      assert response == %{
        "assignees_count" => 0,
        "completed_count" => 0,
        "created_at" => "2016-04-03T12:27:02Z",
        "description" => nil,
        "id" => 29415,
        "last_updated_at" => "2016-04-03T12:27:17Z",
        "links" => %{
          "shareable" => "http://test.lessonly.localhost:3000/lesson/29415-test-lesson-2"
        },
        "public" => false,
        "resource_type" => "lesson",
        "retake_score" => 0,
        "tags" => [],
        "title" => "Test Lesson 2",
        "type" => "lesson"
      }
    end
  end
end
