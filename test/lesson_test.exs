defmodule LessonTest do
  use Lessonly.ApiTest

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

  test "update" do
    use_cassette "lesson.update" do
      response = client |> Lessonly.Lesson.update(29415, %{"title" => "Testy Lesson 2"})

      assert response == %{
        "assignees_count" => 1,
        "completed_count" => 0,
        "created_at" => "2016-04-03T12:27:02Z",
        "description" => nil,
        "id" => 29415,
        "last_updated_at" => "2016-04-03T15:45:52Z",
        "links" => %{
          "shareable" => "http://test.lessonly.localhost:3000/lesson/29415-testy-lesson-2"
        },
        "public" => false,
        "resource_type" => "lesson",
        "retake_score" => 0,
        "tags" => [],
        "title" => "Testy Lesson 2",
        "type" => "update_lesson"
      }
    end
  end

  test "assignments" do
    use_cassette "lesson.assignments" do
      response = client |> Lessonly.Lesson.assignments(29415)

      assert response == %{
        "assignments" => [
          %{
            "assignable_id" => 29415,
            "assignable_type" => "Lesson",
            "assignee_id" => 544547,
            "completed_at" => nil,
            "due_by" => "2020-12-31T00:00:00Z",
            "ext_uid" => nil,
            "id" => 941035,
            "reassigned_at" => nil,
            "resource_type" => "assignment",
            "score" => 0,
            "started_at" => nil,
            "status" => "Incomplete",
            "updated_at" => "2016-04-03T14:55:00Z"
          }
        ],
        "page" => 1,
        "per_page" => 50,
        "total_assignments" => 1,
        "total_pages" => 1,
        "type" => "lesson_assignments"
      }
    end
  end

  test "assign" do
    use_cassette "lesson.assign" do
      response = client |> Lessonly.Lesson.assign(
        29415,
        %{
          "assignments" => [
            %{
              "assignee_id" => 544547,
              "due_by" => "2020-06-01"
            }
          ]
        }
      )

      assert response == %{
        "assignments" => [
          %{
            "assignable_id" => 29415,
            "assignable_type" => "Lesson",
            "assignee_id" => 544547,
            "completed_at" => nil,
            "due_by" => "2020-12-31T00:00:00Z",
            "ext_uid" => nil,
            "id" => 941035,
            "reassigned_at" => nil,
            "resource_type" => "assignment",
            "score" => 0,
            "started_at" => nil,
            "status" => "Incomplete",
            "updated_at" => "2016-04-03T14:55:00Z"
          }
        ],
        "type" => "update_lesson_assignments"
      }
    end
  end
end
