defmodule Adept.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/adept-bits/adept"


  def project do
    [
      app: :adept,
      version: @version,
      description: "A collection of light and simple utility functions for Elixir",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:benchee, "~> 1.1", only: :dev}
    ]
  end

  defp package do
    %{
      licenses: ["Apache-2.0"],
      maintainers: ["Boyd Multerer"],
      links: %{"GitHub" => @url}
    }
  end

  def docs do
    [
      extras: ["README.md"],
      source_ref: "v#{@version}",
      source_url: @url,
      main: "readme"
    ]
  end

end
