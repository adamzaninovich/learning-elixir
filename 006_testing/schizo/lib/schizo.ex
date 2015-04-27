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

  @doc """
    Splits a string into words and runs the transformer
    function on each word with an index before joining
    the words back into a string
  """
  defp apply_fn_to_words string, transformer do
    string
    |> String.split
    |> Stream.with_index
    |> Enum.map(transformer)
    |> Enum.join(" ")
  end

  @doc """
    Returns a function that upcases words with an odd index
  """
  defp uppercaser_of_odds do
    every_other &String.upcase/1
  end

  @doc """
    Returns a function that unvowels words with an odd index
  """
  defp unvowler_of_odds do
    every_other &(String.replace &1, ~r/[aeiou]/, "")
  end

  @doc """
    Returns a function that runs a given function on words
    with odd indices
  """
  defp every_other func do
    require Integer
    fn
      {word, i} when Integer.is_odd(i) -> func.(word)
      {word, _} -> word
    end
  end
end
