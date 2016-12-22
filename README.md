# lessonly

[![Hex pm](https://img.shields.io/hexpm/v/lessonly.svg)](https://hex.pm/packages/lessonly)

An Elixir-flavored wrapper for the [Lessonly](http://www.lessonly.com) [API](http://docs.lessonly.com/).

## Installation

Add lessonly to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:lessonly, "~> 0.0.1"}]
end
```

## Usage

```elixir
# Instantiate a client with your subdomain and API key
iex> client = Lessonly.Client.new("test", "t5tNqaykVwN3Hk1VXXNLOKG6snTMnU8U")

# Make requests!
iex> client |> Lessonly.Lessons.all

    %{"id" => 29414, "title" => "Test Lesson 1"},
    %{"id" => 29415, "title" => "Test Lesson 2"}

iex> client |> Lessonly.User.find(544547)

    %{
      "custom_user_field_data" => [],
      "email" => "test1@lessonly.com",
      "ext_uid" => nil,
      "id" => 544547,
      "name" => "Test User 1",
      "resource_type" => "user",
      "role" => "admin",
      "type" => "user"
    }

iex> assignments = %{"assignee_id" => 544547, "due_by" => "2020-12-31"}
iex> client |> Lessonly.Lesson.assign(%{"assignments" => assignments})

    %{
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
```
