defmodule EchoWeb.EraserLive do
  use EchoWeb, :live_view
  alias Echo.Game.Eraser
  alias Echo.Game

  def mount(%{"slug" => slug}, _session, socket) do
    socket = assign(socket, game: Game.new(slug))
    {:ok, socket}
  end

  def handle_event("step", _, socket) do
    {:noreply, do_step(socket)}
  end

  defp do_step(%{assigns: %{game: game}} = socket) do
    assign(socket, game: Eraser.erase(game))
  end
end
