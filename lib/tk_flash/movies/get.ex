defmodule TkFlash.Movies.Get do
  alias TkFlash.{Movie, Repo}

  def call do
    Movie
    |> Repo.all()
    |> handle_get()
  end

  defp handle_get([]), do: {"Empty database", :not_found}

  defp handle_get(movies), do: {movies, :ok}
end
