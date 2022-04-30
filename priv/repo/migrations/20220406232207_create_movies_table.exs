defmodule TkFlash.Repo.Migrations.CreateMoviesTable do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :poster, :string
      add :synopsis, :string, size: 350
      add :date, :string

      timestamps()
    end

    create unique_index(:movies, [:title, :poster, :synopsis, :date])
  end
end
