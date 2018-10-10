defmodule StructVsEcto.MixProject do
  use Mix.Project

  def project do
    [
      app: :struct_vs_ecto,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps, do: [ecto: "~> 2.2.1", benchee: "~> 0.13"]
end
