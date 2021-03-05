defmodule Cronwithregistry.Repo.Migrations.Morty do
  use Ecto.Migration

  use Ecto.Migration

  def up do
    create table(:morty) do
      add :titulo, :string, size: 100
      add :descripcion, :string, size: 200
      add :crecimiento, :string
      add :porcentaje, :string
      timestamps()
    end
  end

  def down do
    drop table(:test)
  end
end
