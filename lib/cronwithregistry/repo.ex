defmodule Cronwithregistry.Repo do
  use Ecto.Repo,
    otp_app: :cronwithregistry,
    adapter: Ecto.Adapters.Postgres
end
