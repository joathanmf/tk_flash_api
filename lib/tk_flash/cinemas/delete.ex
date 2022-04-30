defmodule TkFlash.Cinemas.Delete do
  alias TkFlash.{Cinema, Repo}

  def call(id) do
    get_cinema = Repo.get(Cinema, id)

    case get_cinema do
      nil ->
        {:error, %{result: "Cinema not found", status: :not_found}}

      _ ->
        Repo.delete(get_cinema)
    end
  end
end
