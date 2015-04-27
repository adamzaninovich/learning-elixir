defmodule ElixirCardDeck do
  def make_deck do
    for card <- cards, suit <- suits do
      {:card, card, suit}
    end
  end

  def cards do
    [:a, 2, 3, 4, 5, 6, 7, 8, 9, 10, :j, :q, :k]
  end

  def suits do
    [:spades, :clubs, :diamonds, :hearts]
  end
end
