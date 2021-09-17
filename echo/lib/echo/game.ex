defmodule Echo.Game do
  alias Echo.Repo
  alias Echo.Game.Eraser
  alias Echo.Library.Passage

  import Ecto.Query

  def new(slug) do
    q = from(p in Passage, where: p.name == ^slug)
    passage = Repo.one(q)

    Eraser.new(passage.phrase, passage.steps)
  end
end
