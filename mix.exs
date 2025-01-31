defmodule JSONAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jsonapi,
      version: "1.6.3",
      package: package(),
      compilers: Mix.compilers(),
      description: description(),
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/beam-community/jsonapi",
      deps: deps(),
      dialyzer: dialyzer(),
      docs: [
        extras: [
          "README.md"
        ],
        main: "readme"
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp dialyzer do
    [
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
      plt_add_deps: :app_tree
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.10"},
      {:jason, "~> 1.0", optional: true},
      {:ex_doc, "~> 0.20", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.7", only: :test},
      {:dialyxir, "~> 1.4.2", only: [:dev, :test], runtime: false},
      {:telemetry, "~> 1.0"}
    ]
  end

  defp package do
    [
      maintainers: [
        "Jason Stiebs",
        "Mitchell Henke",
        "Jake Robers",
        "Sean Callan",
        "James Herdman",
        "Mathew Polzin"
      ],
      licenses: ["MIT"],
      links: %{
        github: "https://github.com/beam-community/jsonapi",
        docs: "http://hexdocs.pm/jsonapi/"
      }
    ]
  end

  defp description do
    """
    Fully functional JSONAPI V1 Serializer as well as a QueryParser for Plug based projects and applications.
    """
  end
end
