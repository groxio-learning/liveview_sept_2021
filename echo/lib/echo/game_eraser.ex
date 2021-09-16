defmodule Echo.GameEraser do
  def new(passage) do
    %{
      phrase: passage.phrase,
      plan: calc_plan(passage),
      current_step: 1,
    }
  end

  def calc_plan(%{phrase: phrase, steps: steps} = passage) do
    len = String.length(phrase) - 1
    chunks = div(len, steps) 
    0..len |> Enum.shuffle |> Enum.chunk_every(chunks)
  end

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

  def verify(input, erased_phrase) do
    input == erased_phrase ?
  end

  def verify()

  def inc_mask () do
    step =+1 
    erase(harder_step)
  end

  def get_current do
    render masked
  end

  # T__s _s __ e_a_p_e  | ERASE
  #
  # ___ __ __ _______ 

end
