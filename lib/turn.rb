require 'pry'
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      return :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
  end

  def winner
    current_type = type
    if current_type == :basic
      return player1.name if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player2.name if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
    elsif current_type == :war
      return player1.name if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player2.name if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
    elsif current_type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    current_type = type
    if current_type == :basic
      @spoils_of_war << player1.deck.cards.last
      @spoils_of_war << player2.deck.cards.last
      player1.deck.cards.pop
      player2.deck.cards.pop
    elsif current_type == :war
      @spoils_of_war << player1.deck.cards.last(3)
      @spoils_of_war << player2.deck.cards.last(3)
      player1.deck.cards.last(3).pop
      player2.deck.cards.last(3).pop
    elsif current_type == :mutually_assured_destruction
      player1.deck.cards.last(3).pop
      player2.deck.cards.last(3).pop
    end
  end
end
