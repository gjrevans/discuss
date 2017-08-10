defmodule Discuss.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  # Phoenix automatically creates a struct based on the model %Discuss.Topic{}

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
