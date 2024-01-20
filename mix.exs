defmodule Formula2.MixProject do
  use Mix.Project

  def project do
    [
      app: :formula2,
      version: "0.1.0",
      elixir: "~> 1.10",
      description:
        "(LISP) style formula parser & evaluator (at runtime) with support for variables and (safe) custom functions",
      homepage_url: "https://github.com/bonfire-networks/formula2",
      source_url: "https://github.com/bonfire-networks/formula2",
      package: [
        licenses: ["Apache-2.0"],
        # organization: "bonfire",
        links: %{
          "Repository" => "https://github.com/bonfire-networks/formula2",
          "Hexdocs" => "https://hexdocs.pm/formula2"
        }
      ],
      docs: [
        # The first page to display from the docs
        main: "readme",
        # extra pages to include
        extras: ["README.md"]
      ],
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: [
        {:stream_data, "~> 0.5"},
        {:decimal, "~> 1.6 or ~> 2.0"},
        {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      ]
    ]
  end

  def application, do: [extra_applications: [:logger, :runtime_tools]]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      "hex.setup": ["local.hex --force"],
      "rebar.setup": ["local.rebar --force"],
      setup: [
        "hex.setup",
        "rebar.setup",
        "deps.get"
      ]
    ]
  end
end
