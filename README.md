# Dockerex

Dockerex is a Docker API Client for Elixir that supports SSL connection to a Docker Host or a Docker Swarm manager.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `dockerex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:dockerex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `dockerex` is started before your application:

    ```elixir
    def application do
      [applications: [:dockerex]]
    end
    ```
  
  3. Config your docker host in `config.exs`
  
  ```
  config :dockerex,
  host: "https://10.10.10.1:2376/",
  options: [
    ssl:  [
      {:certfile, "/path/to/your/cert.pem"},
      {:keyfile, "/path/to/your/key.pem"}
    ]
  ]
  ```
  

