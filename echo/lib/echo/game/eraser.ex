defmodule Echo.Game.Eraser do
  defstruct [:phrase, :plan]

  def new(phrase, steps) do
    %__MODULE__{phrase: phrase, plan: calc_plan(phrase, steps)}
  end

  def calc_plan(phrase, steps) do
    len = String.length(phrase) - 1
    step_size = ceil(len / steps)
    0..len |> Enum.shuffle() |> Enum.chunk_every(step_size)
  end

  def get_text(eraser) do
    eraser.phrase
  end

  def erase(%{phrase: phrase, plan: [masks | plan]} = game) do
    %{game | plan: plan, phrase: replace(phrase, masks)}
  end

  # masked string for a given step
  defp replace(phrase, masks) do
    phrase
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map(fn {letter, index} ->
      if(Enum.member?(masks, index), do: "_", else: letter)
    end)
    |> List.to_string()
  end
end
