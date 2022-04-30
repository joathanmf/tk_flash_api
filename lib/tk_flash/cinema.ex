defmodule TkFlash.Cinema do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :city, :number, :capacity]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "cinemas" do
    field :name, :string
    field :city, :string
    field :number, :string
    field :capacity, :integer

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name, :city, :number])
  end
end
