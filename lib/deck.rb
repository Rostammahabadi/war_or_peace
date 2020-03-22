class Deck

  attr_reader :counter, :high_ranking_cards, :cards
  def initialize(cards)
    @cards = cards
    @counter = 0.0
    @high_ranking_cards = []
  end

  def rank_of_card_at(arg)
    @cards[arg].rank
  end

  def high_ranking_cards
    @cards.each do |card|
      if card.rank >= 11
        @high_ranking_cards << card
        @counter += 1
      end
    end
    @high_ranking_cards
  end

  def percent_high_ranking
    high_ranking_cards
    percent = @counter / @cards.size
    reset_counter
    percentage = (percent.round(4))*100
    return percentage
  end

  def remove_card
    reset_counter
    @cards.shift
  end

  def add_card(card)
    reset_counter
    @cards << card
  end

  def reset_counter
    @counter = 0.0
  end

end
