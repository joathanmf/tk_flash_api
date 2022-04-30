defmodule TkFlash.Repo do
  use Ecto.Repo,
    otp_app: :tk_flash,
    adapter: Ecto.Adapters.Postgres
end
