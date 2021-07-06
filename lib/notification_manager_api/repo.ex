defmodule NotificationManagerApi.Repo do
  use Ecto.Repo,
    otp_app: :notification_manager_api,
    adapter: Ecto.Adapters.Postgres
end
