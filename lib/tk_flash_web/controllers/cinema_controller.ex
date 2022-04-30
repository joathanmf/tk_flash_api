defmodule TkFlashWeb.CinemaController do
  use TkFlashWeb, :controller

  alias TkFlash.Cinema
  alias TkFlash.Cinemas.{Get, Create, Delete}

  alias TkFlashWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    {result, status} = Get.call()

    conn
    |> put_status(status)
    |> render("get.json", cinemas: result)
  end

  def create(conn, params) do
    with {:ok, %Cinema{} = cinema} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", cinema: cinema)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Cinema{} = cinema} <- Delete.call(id) do
      conn
      |> put_status(:ok)
      |> render("delete.json", cinema: cinema)
    end
  end
end
