defmodule EchoWeb.EraserLive do
  use EchoWeb, :live_view
  alias Echo.Game.Eraser

  def mount(_params, _session, socket) do
    socket = assign(socket, game: Eraser.new("abcde", 3))
    {:ok, socket}
  end

  def handle_event("step", _, socket) do
    {:noreply, do_step(socket)}
  end

  defp do_step(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Eraser.erase(game))
  end
end
