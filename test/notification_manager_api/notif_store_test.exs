defmodule NotificationManagerApi.NotifStoreTest do
  use NotificationManagerApi.DataCase

  alias NotificationManagerApi.NotifStore

  describe "notifications" do
    alias NotificationManagerApi.NotifStore.Notification

    @valid_attrs %{body: %{}}
    @update_attrs %{body: %{}}
    @invalid_attrs %{body: nil}

    def notification_fixture(attrs \\ %{}) do
      {:ok, notification} =
        attrs
        |> Enum.into(@valid_attrs)
        |> NotifStore.create_notification()

      notification
    end

    test "list_notifications/0 returns all notifications" do
      notification = notification_fixture()
      assert NotifStore.list_notifications() == [notification]
    end

    test "get_notification!/1 returns the notification with given id" do
      notification = notification_fixture()
      assert NotifStore.get_notification!(notification.id) == notification
    end

    test "create_notification/1 with valid data creates a notification" do
      assert {:ok, %Notification{} = notification} = NotifStore.create_notification(@valid_attrs)
      assert notification.body == %{}
    end

    test "create_notification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NotifStore.create_notification(@invalid_attrs)
    end

    test "update_notification/2 with valid data updates the notification" do
      notification = notification_fixture()
      assert {:ok, %Notification{} = notification} = NotifStore.update_notification(notification, @update_attrs)
      assert notification.body == %{}
    end

    test "update_notification/2 with invalid data returns error changeset" do
      notification = notification_fixture()
      assert {:error, %Ecto.Changeset{}} = NotifStore.update_notification(notification, @invalid_attrs)
      assert notification == NotifStore.get_notification!(notification.id)
    end

    test "delete_notification/1 deletes the notification" do
      notification = notification_fixture()
      assert {:ok, %Notification{}} = NotifStore.delete_notification(notification)
      assert_raise Ecto.NoResultsError, fn -> NotifStore.get_notification!(notification.id) end
    end

    test "change_notification/1 returns a notification changeset" do
      notification = notification_fixture()
      assert %Ecto.Changeset{} = NotifStore.change_notification(notification)
    end
  end
end
