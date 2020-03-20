require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class CardTest < Minitest::Test

  def test_turn_has_two_players
    player1 = Player.new("Megan", Deck.new([]))
    player2 = Player.new("Aurora", Deck.new([]))
    turn = Turn.new(player1, player2)

    assert turn.player1
    assert turn.player2
    assert_equal [], turn.spoils_of_war
  end

  def test_winner_functionality
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal player1 , turn.winner
  end

  def test_turn_war_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1,card2,card3])
    deck2 = Deck.new([card4,card5,card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_turn_mutually_assured_destruction_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '8', 8)
    card3 = Card.new(:heart, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:diamond, '7', 7)
    card6 = Card.new(:diamond, 'Jack', 11)
    deck1 = Deck.new([card1,card2,card3])
    deck2 = Deck.new([card4,card5,card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_basic_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:diamond, '7', 7)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_pile_cards_basic_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:diamond, '7', 7)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.type
    turn.winner
    turn.pile_cards

    assert_equal [], player1.deck.cards
    assert_equal [], player2.deck.cards
  end

  def test_pile_cards_war_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1,card2,card3])
    deck2 = Deck.new([card4,card5,card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.winner
    turn.pile_cards

    assert_equal [], player1.deck.cards
    assert_equal [], player2.deck.cards

  end

  def test_pile_cards_mutually_assured_destruction
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '8', 8)
    card3 = Card.new(:heart, 'Jack', 11)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:diamond, '7', 7)
    card6 = Card.new(:diamond, 'Jack', 11)
    deck1 = Deck.new([card1,card2,card3])
    deck2 = Deck.new([card4,card5,card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    turn.winner
    turn.pile_cards

    assert_equal [], player1.deck.cards
    assert_equal [], player2.deck.cards
  end

  def test_award_spoils_for_player1_basic_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:diamond, '7', 7)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 2, player1.deck.cards.count
  end

  def test_award_spoils_for_player1_war_type
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1,card2,card3])
    deck2 = Deck.new([card4,card5,card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 6, player2.deck.cards.size
    assert_equal [], turn.spoils_of_war
  end

end
