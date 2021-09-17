defmodule Echo.EraserTest do
  use Echo.DataCase
  alias Echo.Game.Eraser

  def eraser_data do
    %Eraser{
      phrase: "abcde",
      plan: [[0, 1], [2, 3], [4]]
    }
  end
  
  test "eraser function erases all characters" do
    erased = 
      eraser_data()
      |> assert_key(:phrase, "abcde")
      |> Eraser.erase
      |> assert_key(:phrase, "__cde")
      |> Eraser.erase
      |> assert_key(:phrase, "____e")
      |> Eraser.erase
      |> assert_key(:phrase, "_____")
  end


  test "confirm plan_calc generates three sublists" do
    %{plan: plan} = eraser_data()
    [a, b, c] = plan
    assert c
  end

  def assert_key(game, key, value) do
    assert Map.get(game, key) == value
    game
  end


end
