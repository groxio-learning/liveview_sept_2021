defmodule Echo.EraserTest do
  use Echo.DataCase
  alias Echo.Game.Eraser

  def eraser_data, do: Eraser.new("The initial longer phraser", 3)
  
  test "eraser function erases all characters" do
    erased = 
      eraser_data()
      |> Eraser.erase
      |> Eraser.erase
      |> Eraser.erase

    assert erased.phrase == "__________________________"
  end


  test "confirm plan_calc generates three sublists" do
    %{plan: plan} = eraser_data()
    [a, b, c] = plan
    assert c
  end

  


end
