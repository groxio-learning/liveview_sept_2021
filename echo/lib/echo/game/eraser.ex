defmodule Echo.Game.Eraser do

  
  def erase(%{phrase: phrase, plan: [masks | plan]} = game) do
    %{game | plan: plan, phrase: replace(phrase, masks)}
  end

  # masked string for a given step
  defp replace(phrase, masks) do
    phrase
    |> String.graphemes
    |> Enum.with_index
    |> Enum.map(fn {letter, index} -> 
      if(Enum.member?(masks, index), do: "_", else: letter)
    end)
    |> List.to_string
  end
 
end
