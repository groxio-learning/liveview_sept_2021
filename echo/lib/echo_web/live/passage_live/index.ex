defmodule EchoWeb.PassageLive.Index do
  use EchoWeb, :live_view

  alias Echo.Library
  alias Echo.Library.Passage

  @impl true
  def mount(_params, _session, socket) do
    {:ok, list_passages(socket)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Passage")
    |> assign(:passage, Library.get_passage!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Passage")
    |> assign(:passage, %Passage{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Passages")
    |> assign(:passage, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    passage = Library.get_passage!(id)
    {:ok, _} = Library.delete_passage(passage)

    {:noreply, list_passages(socket)}
  end

  defp list_passages(socket) do
    assign(socket, :passages, Library.list_passages())
  end
end
