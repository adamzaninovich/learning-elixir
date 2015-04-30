defmodule Dijkstra do
  def gcd(m, m), do: m
  def gcd(m, n) when m > n, do: gcd(m-n, n)
  def gcd(m, n), do: gcd(m, n-m)
end
