defmodule NotificationManagerApi.Repo.Migrations.CreateNotifications do
  use Ecto.Migration

  def change do
    create table(:notifications, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :map, default: %{}

      timestamps()
    end

  end
end
