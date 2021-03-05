defmodule Cronwithregistry.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Cronwithregistry.Repo,
      # Start the Telemetry supervisor
      CronwithregistryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Cronwithregistry.PubSub},
      # Start the Endpoint (http/https)
      CronwithregistryWeb.Endpoint,
      # Start a worker by calling: Cronwithregistry.Worker.start_link(arg)
      # {Cronwithregistry.Worker, arg}
      Notificacion,
      {Cronwithregistry.Registry, name: Cronwithregistry.Registry}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cronwithregistry.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CronwithregistryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
