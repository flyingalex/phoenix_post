defmodule PhoenixPost.Post do
  use PhoenixPost.Web, :model

  schema "posts" do
    field :title, :string
    field :author, :string
    field :conent, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :author, :conent])
    |> validate_required([:title, :author, :conent])
  end
end
