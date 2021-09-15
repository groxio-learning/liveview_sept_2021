defmodule Echo.Map.Math do

  def initial, do: 0

  def inc(n), do: n + 1

  def dec(n), do: n - 1

  def message(n) do
    "The treasure is at #{n}."
  end

end
