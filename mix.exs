defmodule KinoSmartCellTemplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :kino_smart_cell_template,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:kino, "~> 0.12.3"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix js"],
      test: ["test", "cmd npm test --prefix js"],
      # Running tsc first to avoid warning about empty "assets" folder
      compile: [esbuild_command(), "compile"],
      "compile.watch": ["compile", esbuild_command() <> " --watch"]
    ]
  end

  defp esbuild_command do
    "cmd --cd js npx esbuild src/main.ts --outfile=../assets/main.js --bundle --format=esm"
  end
end
