defmodule TkFlash.Movies.Create do
  alias TkFlash.{Movie, Repo}

  def call do
    get_json("movies.json")
    |> Enum.map(fn x ->
      Movie.changeset(x)
      |> Repo.insert()
    end)
    |> Enum.filter(fn {status, _result} -> status == :ok end)
    |> handle_create()
  end

  defp handle_create([]), do: {:error, %{result: "There is nothing to do", status: :ok}}

  defp handle_create(params) do
    movies = Enum.map(params, fn {:ok, x} -> x end)

    {:ok, movies}
  end

  defp get_json(filename) do
    with {:ok, body} <- File.read(filename),
         {:ok, json} <- Jason.decode(body) do
      json
    end
  end
end
