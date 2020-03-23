require './lib/turn'
require './lib/deck'
require './lib/player'
require './lib/card'

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
      return player1 if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player2 if player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0)
    elsif current_type == :war
      return player1 if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player2 if player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2)
    elsif current_type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def pile_cards
    current_type = type
    if current_type == :basic
      @spoils_of_war << player1.deck.cards.first
      @spoils_of_war << player2.deck.cards.first
      player1.deck.cards.delete_at(0)
      player2.deck.cards.delete_at(0)
    elsif current_type == :war
      @spoils_of_war << player1.deck.remove_three
      @spoils_of_war << player2.deck.remove_three
      @spoils_of_war.flatten!
    elsif current_type == :mutually_assured_destruction
      player1.deck.remove_three
      player2.deck.remove_three
    end
  end

  def award_spoils(winner)
    if winner == player1
      player1.deck.cards.push(*@spoils_of_war)
      @spoils_of_war = []
    elsif winner == player2
      player2.deck.cards.push(*@spoils_of_war)
      @spoils_of_war = []
    end
  end

end
