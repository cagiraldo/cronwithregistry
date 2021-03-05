defmodule Cronwithregistry.Tabla do
  use Ecto.Schema
  import Ecto.Changeset

  schema "morty" do
    field :titulo, :string
    field :descripcion, :string
    field :crecimiento, :string
    field :porcentaje, :string

    timestamps()
  end

  def changeset(morty, params \\ %{}) do
    morty
    |> cast(params, [:titulo, :descripcion, :crecimiento, :porcentaje])
    |> validate_required([:titulo, :descripcion, :crecimiento, :porcentaje])
  end
end
