defmodule Echo.Game.Eraser do
  defstruct phrase: string, plan: []

  def new(phrase, steps) do
    len = String.length(phrase)
    plan = 1..len |> Enum.shuffle() |> Enum.chunk_every(steps)
    %Eraser{phrase: phrase, plan: plan}
  end

  def get_text(eraser) do
    eraser.phrase
  end
end
