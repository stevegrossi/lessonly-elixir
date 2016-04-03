defmodule CourseTest do
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
    use_cassette "course.all" do
      response = Lessonly.Course.all(client)
      assert response == [
        %{"id" => 3466, "title" => "Test Course 1"},
        %{"id" => 3467, "title" => "Test Course 2"}
      ]
    end
  end

  test "find" do
    use_cassette "course.find" do
      response = client |> Lessonly.Course.find(3467)
      assert response == %{
        "assignees_count" => 0,
        "completed_count" => 0,
        "created_at" => "2016-04-03T12:28:21Z",
        "description" => "Test course 2 description.",
        "id" => 3467,
        "last_updated_at" => nil,
        "lessons" => [
          %{"assignees_count" => 0,
            "completed_count" => 0,
            "created_at" => "2016-04-03T12:26:39Z",
            "description" => nil,
            "id" => 29414,
            "last_updated_at" => "2016-04-03T12:26:58Z",
            "links" => %{
              "shareable" => "http://test.lessonly.localhost:3000/lesson/29414-test-lesson-1"
            },
            "public" => false,
            "resource_type" => "lesson",
            "retake_score" => 0,
            "tags" => [],
            "title" => "Test Lesson 1"
          },
          %{"assignees_count" => 0,
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
            "retake_score" => 0, "tags" => [],
            "title" => "Test Lesson 2"
          }
        ],
        "links" => %{
          "shareable" => "http://test.lessonly.localhost:3000/course/3467-test-course-2"
        },
        "public" => false,
        "resource_type" => "course",
        "tags" => [],
        "title" => "Test Course 2",
        "type" => "course"
      }
    end
  end
end
