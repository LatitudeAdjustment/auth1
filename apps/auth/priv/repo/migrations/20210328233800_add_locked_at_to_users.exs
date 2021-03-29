defmodule Auth.Repo.Migrations.AddLockedAtToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :locked_at, :utc_datetime_usec
    end
  end
end
