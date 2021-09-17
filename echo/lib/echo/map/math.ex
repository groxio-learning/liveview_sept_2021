defmodule Echo.Map.Math do
  def initial, do: 0


  def inc(n, n), do: 0
  def inc(n, _max), do: n + 1

  def dec(0, max), do: max
  def dec(n, _max), do: n - 1



end 
