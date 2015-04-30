defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  def raise(_, 0), do: 1
  def raise(x, 1), do: x
  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)

  # 4-3 non-tail recurs
  # def raise(x, n), do: x * raise(x, n-1)

  # 4-4 tail recurs with acc
  def raise(x, n), do: raise(x, n, 1)
  def raise(_, 0, acc), do: acc
  def raise(x, n, acc), do: raise(x, n-1, x*acc)

  # 4-5 recurs with helper
  def nth_root(x, n), do: nth_root(x, n, x / 2.0)
  def nth_root(x, n, approx) do
    IO.puts "Current guess is #{approx}"
    next = approx - (raise(approx, n) - x)/(n * raise(approx, n - 1))
    case abs(next - approx) do
      x when x < 1.0e-8 -> next
      _ -> nth_root(x, n, next)
    end
  end
end
