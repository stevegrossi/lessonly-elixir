defmodule CourseTest do
  use Lessonly.ApiTest

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

  test "assignments" do
    use_cassette "course.assignments" do
      response = client |> Lessonly.Course.assignments(3467)

      assert response == %{
        "assignments" => [
          %{
            "assignable_id" => 3467,
            "assignable_type" => "Course",
            "assignee_id" => 544547,
            "completed_at" => nil,
            "due_by" => "2020-03-01T00:00:00Z",
            "ext_uid" => nil,
            "id" => 941036,
            "reassigned_at" => nil,
            "resource_type" => "assignment",
            "score" => 0,
            "started_at" => nil,
            "status" => "Incomplete",
            "updated_at" => nil
          }
        ],
        "page" => 1,
        "per_page" => 50,
        "total_assignments" => 1,
        "total_pages" => 1,
        "type" => "course_assignments"
      }
    end
  end

  test "assign" do
    use_cassette "course.assign" do
      response = client |> Lessonly.Course.assign(
        3467,
        %{
          "assignments" => [
            %{
              "assignee_id" => 544547,
              "due_by" => "2020-03-01"
            }
          ]
        }
      )

      assert response == %{
        "assignments" => [
          %{
            "assignable_id" => 3467,
            "assignable_type" => "Course",
            "assignee_id" => 544547,
            "completed_at" => nil,
            "due_by" => "2020-03-01T00:00:00Z",
            "ext_uid" => nil,
            "id" => 941036,
            "reassigned_at" => nil,
            "resource_type" => "assignment",
            "score" => 0,
            "started_at" => nil,
            "status" => "Incomplete",
            "updated_at" => nil
          }
        ],
       "type" => "update_course_assignments"
      }
    end
  end
end
