# NOTE: Maps the data stored in the database to Elixir data structures and adds validation
defmodule NotificationManagerApi.NotifStore.Notification do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "notifications" do
    field :body, :map

    timestamps()
  end

  @doc false
  def changeset(notification, attrs) do
    notification
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
