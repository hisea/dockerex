defmodule Dockerex.Mixfile do
  use Mix.Project

  def project do
    [app: :dockerex,
     version: "0.1.0",
     elixir: "~> 1.3",
     description: "A lightweight Docker api client that supports SSL connection.",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:httpoison, :logger]]
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
      {:poison, "~> 2.2.0"},
      {:httpoison, "~> 0.11.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [licenses: ["MIT"],
     maintainers: ["Yinghai Zhao"],
     links: %{"GitHub" => "https://github.com/hisea/dockerex"}]
  end

end
