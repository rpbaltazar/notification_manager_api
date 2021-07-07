defmodule NotificationManagerApiWeb.NotificationController do
  use NotificationManagerApiWeb, :controller

  alias NotificationManagerApi.NotifStore
  alias NotificationManagerApi.NotifStore.Notification

  action_fallback NotificationManagerApiWeb.FallbackController

  def index(conn, _params) do
    notifications = NotifStore.list_notifications()
    render(conn, "index.json", notifications: notifications)
  end

  def create(conn, notification_params) do
    with {:ok, %Notification{} = notification} <- NotifStore.create_notification(%{"body" => notification_params}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.notification_path(conn, :show, notification))
      |> render("show.json", notification: notification)
    end
  end

  def show(conn, %{"id" => id}) do
    notification = NotifStore.get_notification!(id)
    render(conn, "show.json", notification: notification)
  end

  def update(conn, %{"id" => id, "notification" => notification_params}) do
    notification = NotifStore.get_notification!(id)

    with {:ok, %Notification{} = notification} <- NotifStore.update_notification(notification, notification_params) do
      render(conn, "show.json", notification: notification)
    end
  end

  def delete(conn, %{"id" => id}) do
    notification = NotifStore.get_notification!(id)

    with {:ok, %Notification{}} <- NotifStore.delete_notification(notification) do
      send_resp(conn, :no_content, "")
    end
  end
end
