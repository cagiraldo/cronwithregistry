defmodule CronwithregistryWeb.TopicLiveController do
  # If you generated an app with mix phx.new --live,
  # the line below would be: use MyAppWeb, :live_view
  use Phoenix.LiveView
  alias Cronwithregistry.HelperTopic
  # def render(assigns) do
  #   ~L"""
  #   Current temperature: <%= @temperature %>
  #   """
  # #end

  def render(assigns) do
    Phoenix.View.render(CronwithregistryWeb.TopicView, "vista.html", assigns)
  end

  def mount(_params, _, socket) do
    if connected?(socket), do: :timer.send_interval(10000, self(), :update)
    data = HelperTopic.getdata()
    {:ok, assign(socket, :results, data )}
  end

  def handle_info(:update, socket) do
    data = HelperTopic.getdata()
    {:noreply, assign(socket, :results, data )}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    HelperTopic.delete(id)
    data = HelperTopic.getdata()
    {:noreply, assign(socket, :results, data)}
  end
end
