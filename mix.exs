defmodule Numbers.Mixfile do
  use Mix.Project

  def project do
    [app: :numbers,
     version: "5.1.1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     consolidate_protocols: Mix.env != :test, # Required to see new protocol implementations in the *.exs test helper files.

     description: description(),
     package: package()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:coerce, "~> 1.0"},

      {:decimal, "~> 1.3.0", optional: true},

      {:earmark, ">= 0.0.0", only: [:dev]},    # Markdown, dependency of ex_doc
      {:ex_doc, "~> 0.11",   only: [:dev]},    # Documentation for Hex.pm
      {:inch_ex, only: :docs}                  # Inch CI documentation quality test.
    ]
  end

  defp description do
    """
    Numbers dispatches on any numeric type that follows the `Numeric` behaviour.
    This allows you to create composite types working with _any_ numeric type (Decimal, Ratio, Tensor, ComplexNum, ???)!
    """
  end

  defp package do
    [# These are the default files included in the package
      name: :numbers,
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Wiebe-Marten Wijnja/Qqwy"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Qqwy/elixir_number/"}
    ]
  end
end
