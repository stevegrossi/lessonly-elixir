defmodule Lessonly.Mixfile do
  use Mix.Project

  def project do
    [app: :lessonly,
     version: "0.0.1",
     elixir: "~> 1.2",
     description: description,
     package: package,
     deps: deps]
  end

  defp description do
    """
    An Elixir wrapper for the Lesson.ly API.
    """
  end

  def package do
    [
      maintainers: ["Steve Grossi"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/stevegrossi/lessonly-elixir"}
    ]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 2.0"},
      {:exvcr, "~> 0.7", only: :test},
      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end
end
