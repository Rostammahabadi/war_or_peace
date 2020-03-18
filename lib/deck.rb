class Deck

  attr_reader :counter, :high_ranking_cards
  attr_accessor :cards
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
    reset_counter
    high_ranking_cards
    percent = @counter / @cards.count
    percent = percent.round(4)
    return percent * 100
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
