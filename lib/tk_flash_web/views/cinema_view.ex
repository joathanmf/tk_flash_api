defmodule TkFlashWeb.CinemaView do
  use TkFlashWeb, :view

  def render("get.json", %{cinemas: cinemas}) do
    %{
      cinemas: cinemas
    }
  end

  def render("create.json", %{cinema: cinema}) do
    %{
      message: "Cinema created",
      cinema: cinema
    }
  end

  def render("delete.json", %{cinema: cinema}) do
    %{
      message: "Cinema deleted",
      cinema: cinema
    }
  end
end
