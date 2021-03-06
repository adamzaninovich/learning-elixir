defmodule FridgeServerTest do
  use ExUnit.Case

  test "putting something into the fridge" do
    fridge = FridgeServer.start_link
    assert :ok == FridgeServer.store fridge, :bacon
  end

  test "removing something from the fridge" do
    fridge = FridgeServer.start_link
    FridgeServer.store fridge, :bacon
    assert {:ok, :bacon} == FridgeServer.take fridge, :bacon
  end

  test "removing something that isn't there" do
    fridge = FridgeServer.start_link
    assert :not_found == :gen_server.call fridge, {:take, :bacon}
  end
end
