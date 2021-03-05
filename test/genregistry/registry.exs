defmodule RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registry = start_supervised!(Registry)
    %{registry: registry}
  end

  test "spawns create registers into map with Genserver", %{registry: registry} do
    assert GenServer.cast(registry, {:create, "llave_1", "valor de la llave 1"}) == :ok

    assert {:ok, "valor de la llave 1"} = GenServer.call(registry, {:lookup, "llave_1"})
  end

  test "spawns create registers into map with Functions Genserver", %{registry: registry} do
    assert Registry.create(registry, "llave 2", "valor de la llave 2") == :ok

    assert {:ok, "valor de la llave 2"} = Registry.lookup(registry, "llave 2")
  end
end
