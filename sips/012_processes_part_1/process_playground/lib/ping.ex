defmodule Ping do
  def start do
    receive do
      {:pong, pid} -> send pid, {:ping, self}
    end
    start
  end
end
