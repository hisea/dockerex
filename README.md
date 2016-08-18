# Dockerex

Dockerex is a lightweight Docker Remote API Client for Elixir that supports SSL connection to a Docker Host or a Docker Swarm manager.

 Dockerex is tested against latest [Docker Remote API v1.24](https://docs.docker.com/engine/reference/api/docker_remote_api_v1.24/).
 
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
  
  ## Usage
  Dockerex is a lightweight client, which means you need to specify the endpoint and original docker params in a map format.
  
  Some examples:
  
  
  ```
    result = Dockerex.Client.post("containers/create", %{"Image": "nginx",
                                                         "Tty": true,
                                                         "HostConfig": %{"RestartPolicy": %{ "Name": "always"}},
                                                         "Cmd": ["start.sh"]})

    cid = result["Id"]
    Dockerex.Client.post("containers/#{cid}/start")
    
    Dockerex.Client.post("containers/#{cid}/stop")
    
    Dockerex.Client.get("containers/#{cid}/logs?stderr=1&stdout=1&timestamps=0&since=#{DateTime.to_unix(DateTime.utc_now) - 5}")
    
    Dockerex.Client.delete("containers/#{cid}")
  ```

