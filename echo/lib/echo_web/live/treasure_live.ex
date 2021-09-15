defmodule EchoWeb.TreasureLive do
  use EchoWeb, :live_view
  alias Echo.Map.Math

  # the socket is the state for LiveView

  # called by genserver upon init.
  def mount(_params, _session, socket) do
    {:ok, assign(socket, steps: Math.initial())}
  end

  # def render(assigns) if no render function, then load the template.

  # javascript on the client side sends message through socket with
  # "inc" as event type.
  def handle_event("inc", _value, socket) do
    {:noreply, inc(socket)}
  end

  def handle_event("dec", _value, socket) do
    {:noreply, dec(socket)}
  end

  defp inc(%{assigns: %{steps: n}} = socket) do
    assign(socket, steps: Math.inc(n))
  end

  defp dec(%{assigns: %{steps: n}} = socket) do
    assign(socket, steps: Math.dec(n))
  end
end
