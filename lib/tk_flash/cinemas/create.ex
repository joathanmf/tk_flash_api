defmodule TkFlash.Cinemas.Create do
  alias TkFlash.{Cinema, Repo}

  def call(params) do
    params
    |> Cinema.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Cinema{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, %{result: result, status: :bad_request}}
  end
end
