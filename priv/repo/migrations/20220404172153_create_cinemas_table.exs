defmodule TkFlash.Repo.Migrations.CreateCinemasTable do
  use Ecto.Migration

  def change do
    create table(:cinemas) do
      add :name, :string
      add :city, :string
      add :number, :string
      add :capacity, :integer

      timestamps()
    end

    create unique_index(:cinemas, [:name, :city, :number])
  end
end
