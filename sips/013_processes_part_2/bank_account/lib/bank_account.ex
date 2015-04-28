defmodule BankAccount do
  @moduledoc """
  Keeps track of a simple bank account, accepting messages
  for checking the balance, depositing and withdrawing funds
  """

  @doc """
  Starts a new receive loop

  Accepts the following messages:

    * **Deposit**: receives a message like `{:deposit, amount}`
    * **Withdraw**: receives a message like `{:withdraw, amount}`
    * **Check Balance**: receives a message like `{:balance, pid}`
      * _where the `pid` is the process that should receive the reply_
  """
  def start, do: start []
  defp start events do
    receive do
      {:check_balance, pid} -> divulge_balance pid, events
      {:deposit, amount}    -> events = deposit amount, events
      {:withdraw, amount}   -> events = withdraw amount, events
    end
    start events
  end

  defp deposit amount, events do
    [{:deposit, amount} | events]
  end

  defp withdraw amount, events do
    [{:withdraw, amount} | events]
  end

  defp divulge_balance pid, events do
    send pid, {:balance, calculate_balance events}
  end

  defp calculate_balance events do
    Enum.reduce events, 0, fn
      {:deposit, amount}, acc -> acc + amount
      {:withdraw, amount}, acc -> acc - amount
    end
  end
end
