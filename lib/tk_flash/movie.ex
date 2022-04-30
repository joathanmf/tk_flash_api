defmodule TkFlash.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:title, :poster, :synopsis, :date]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "movies" do
    field :title, :string
    field :poster, :string
    field :synopsis, :string
    field :date, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint(@required_params)
  end
end
