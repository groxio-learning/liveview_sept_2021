defmodule Echo.Library.Passage do
  use Ecto.Schema
  import Ecto.Changeset

  # schema is a macro that implements a "Select *" query
  schema "passages" do
    field(:name, :string)
    field(:phrase, :string)
    field(:steps, :integer)

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:name, :phrase, :steps])
    |> validate_required([:name, :phrase, :steps])
    |> validate_length(:phrase, min: 4)
  end
end
