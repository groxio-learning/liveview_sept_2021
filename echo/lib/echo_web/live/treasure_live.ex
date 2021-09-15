defmodule EchoWeb.TreasureLive do
  use EchoWeb, :live_view
  alias Echo.Map.Math


  def mount(_params, _session, socket) do
    {:ok, assign(socket, steps: Math.initial)}
  end

  def handle_event("inc", _value, socket ) do
    increased_number = Math.inc(socket.assigns.steps)
    {:noreply, assign(socket, steps: increased_number)}
  end


  def handle_event("dec", _value, socket ) do
    decreased_number = Math.dec(socket.assigns.steps)
    {:noreply, assign(socket, steps: decreased_number)}
  end
  


end
