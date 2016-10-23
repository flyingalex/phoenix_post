defmodule PhoenixPost.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :author, :string
      add :conent, :text

      timestamps()
    end

  end
end
