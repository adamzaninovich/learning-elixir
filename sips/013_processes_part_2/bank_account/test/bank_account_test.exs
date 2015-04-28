defmodule BankAccountTest do
  use ExUnit.Case

  test "start off with a balance of 0" do
    account = spawn_link &BankAccount.start/0
    verify_balance_is 0, account
  end

  test "balance increments by amount of deposit" do
    account = spawn_link &BankAccount.start/0
    send account, {:deposit, 10}
    verify_balance_is 10, account
  end

  test "balance decrements by amount of withdraw" do
    account = spawn_link &BankAccount.start/0
    send account, {:deposit, 20}
    send account, {:withdraw, 10}
    verify_balance_is 10, account
  end

  def verify_balance_is expected_balance, account do
    send account, {:check_balance, self}
    assert_receive {:balance, ^expected_balance}
  end
end
