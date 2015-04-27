defmodule Schizo do
  @moduledoc """
    A module that provides methods to uppercase or
    unvowel every other word in a phrase.
  """

  @doc """
  Uppercases every other word

      iex> Schizo.uppercase "you are silly"
      "you ARE silly"
  """
  def uppercase string do
    apply_fn_to_words string, uppercaser_of_odds
  end

  @doc """
  Removes the vowels from every other word

      iex> Schizo.unvowel "you are silly"
      "you r silly"
  """
  def unvowel string do
    apply_fn_to_words string, unvowler_of_odds
  end

  defp apply_fn_to_words string, transformer do
    string
    |> String.split
    |> Stream.with_index
    |> Enum.map(transformer)
    |> Enum.join(" ")
  end

  defp uppercaser_of_odds do
    every_other &String.upcase/1
  end

  defp unvowler_of_odds do
    every_other &(String.replace &1, ~r/[aeiou]/, "")
  end

  defp every_other func do
    require Integer
    fn
      {word, i} when Integer.is_odd(i) -> func.(word)
      {word, _} -> word
    end
  end
end
