defmodule Cronwithregistry.HelperTopic do
  alias Cronwithregistry.Repo
  alias Cronwithregistry.Tabla
  import Ecto.Query

  def insertar(attrs) do
    %Tabla{}
    |> Tabla.changeset(attrs)
    |> Repo.insert()
  end

  def getdata() do
    Repo.all(Tabla)
  end

  def delete(id) do
    Repo.get!(Tabla , id) |> Repo.delete
  end

  # autor
  # |>Examen.Autor.changeset(attrs)
  # |>Repo.update
end
