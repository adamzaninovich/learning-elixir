defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.
  """

  @doc """
  Calculates the area of a shape, given the
  shape and two of the dimensions as a tuple.
  Returns the productof its arguments for a rectangle,
  one half the product of the arguments for a triangle, and
  :math.pi times the product of the arguments for
  an ellipse. Any invalid data returns zero.
  """
  @spec area({atom(), number(), number()}) :: number()
  def area({shape, x, y}), do: area(shape, x, y)

  @spec area(atom(), number(), number()) :: number()

  defp area(shape, x, y) when x >= 0 and y >= 0 do
    case shape do
      :rectangle -> x * y
      :triangle  -> x * y / 2.0
      :ellipse   -> x * y * :math.pi
      _          -> 0
    end
  end
end
