defmodule TkFlashWeb.MovieController do
  use TkFlashWeb, :controller

  alias TkFlash.Movies.{Get, Create}

  alias TkFlashWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _params) do
    {result, status} = Get.call()

    conn
    |> put_status(status)
    |> render("get.json", movies: result)
  end

  def create(conn, _params) do
    with {:ok, movies} <- Create.call() do
      conn
      |> put_status(:created)
      |> render("create.json", movies: movies)
    end
  end
end
