defmodule EchoWeb.TreasureLive do
  use EchoWeb, :live_view
  alias Echo.Map.Math
  alias Echo.Library

  # the socket is the state for LiveView

  # called by genserver upon init.
  def mount(_params, _session, socket) do
    {
      :ok,
      assign(socket,
      steps: Math.initial(),
      passages: Library.list_passages(),
    )
    |> passage}
  end

  # def render(assigns) if no render function, then load the template.

  # javascript on the client side sends message through socket with
  # "inc" as event type.
  def handle_event("inc", _value, socket) do
    {:noreply, socket |> inc |> passage}
  end

  def handle_event("dec", _value, socket) do
    {:noreply, socket |> dec |> passage}
  end

  def handle_event("pick", %{"name" => name} = value, socket) do
    IO.inspect value
    {:noreply, socket |> push_redirect(to: "/eraser/#{name}")}
  end

  defp inc(%{assigns: %{steps: n}} = socket) do
    assign(socket, steps: Math.inc(n, max(socket)))
  end

  defp dec(%{assigns: %{steps: n}} = socket) do
    assign(socket, steps: Math.dec(n, max(socket)))
  end

  defp max(socket), do: socket.assigns.passages |> Enum.count |> Kernel.-(1)

  defp passage(socket) do
    index = socket.assigns.steps
    p = Enum.at(socket.assigns.passages, index)
    assign(socket, passage: p)
  end



end
