defmodule Cronwithregistry.Registry do
  use GenServer
  alias Cronwithregistry.HelperTopic
  # @interval 5 * 60 * 1000

  @impl true
  def init(_) do
    # Process.send_after(self(), :call_free_service, @interval)
    set = MapSet.new()
    {:ok, set}
  end

  @impl true
  def handle_call({:lookup, name}, _from, map_names) do
    # {:reply, resultado de la busqueda, mapa }
    # sync
    {:reply, Map.fetch(map_names, name), map_names}
  end

  # def handle_call({:lookup_2, name}, _from, map_names) do
  #   #{:reply, resultado de la busqueda, mapa }
  #   {:reply, Map.fetch(map_names, name), map_names} #sync
  # end
  # def handle_call({:lookup_3, name}, _from, map_names) do
  #   #{:reply, resultado de la busqueda, mapa }
  #   {:reply, Map.fetch(map_names, name), map_names} #sync
  # end

  @impl true
  def handle_cast({:create, name, valor}, map_names) do
    if Map.has_key?(map_names, name) do
      # async
      {:noreply, name}
    else
      # async
      {:noreply, Map.put(map_names, name, valor)}
    end
  end

  # def handle_info({:create, name, valor}, map_names) do
  #   if Map.has_key?(map_names, name) do
  #     {:noreply, name} #async
  #   else
  #     {:noreply, Map.put(map_names, name, valor)} #async
  #   end
  # end

  @doc """
  Inicio el Genserver de Registry
  """
  def start_link(_) do
    # GenServer.start_link(Registry, :ok, name: Registry)
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  def create(server, name, valor) do
    GenServer.cast(server, {:create, name, valor})
  end

  @impl true
  def handle_cast({:insert_topic, map}, _map_names) do
    HelperTopic.insertar(map)
    {:noreply, %{}}
  end

  def create_table(server, map) do
    GenServer.cast(server, {:insert_topic, map})
  end
end
