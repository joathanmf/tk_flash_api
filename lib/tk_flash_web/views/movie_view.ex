defmodule TkFlashWeb.MovieView do
  use TkFlashWeb, :view

  def render("get.json", %{movies: movies}) do
    %{
      movies: movies
    }
  end

  def render("create.json", %{movies: movies}) do
    %{
      message: "Movies added",
      movies: movies
    }
  end
end
