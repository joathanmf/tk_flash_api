defmodule TkFlash.Cinemas.Get do
  alias TkFlash.{Cinema, Repo}

  def call do
    Cinema
    |> Repo.all()
    |> handle_get()
  end

  defp handle_get([]), do: {"Empty database", :not_found}

  defp handle_get(cinemas), do: {cinemas, :ok}
end
