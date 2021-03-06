defmodule Echo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  # the OTP stuff here, lifecycle concerns (start/stop/children, etc...)
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Echo.Repo,
      # Start the Telemetry supervisor
      EchoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Echo.PubSub},
      # Start the Endpoint (http/https)
      EchoWeb.Endpoint
      # Start a worker by calling: Echo.Worker.start_link(arg)
      # {Echo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Echo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EchoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
