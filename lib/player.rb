class Player

  attr_reader :name, :deck, :lost

  def initialize(name, deck)
    @name = name
    @deck = deck
    @lost = false
  end

  def has_lost?
    @lost = @deck.cards.empty?
    @lost
  end

end
