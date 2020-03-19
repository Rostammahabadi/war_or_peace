require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

class CardTest < Minitest::Test

  def test_there_are_cards_in_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    result = 3
    expected = deck.cards.count
    assert_equal expected, result
  end

  def test_it_has_a_rank_for_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_it_has_another_rank_for_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_there_are_cards_in_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    result = 3
    expected = deck.cards.count
    assert_equal expected, result
  end

  def test_high_ranking_cards_contains_two
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    result = 2
    expected = deck.high_ranking_cards.count
    assert_equal result, expected
  end

  def test_percent_high_ranking
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    assert_equal :spade, cards[0].suit
  end

  def test_card_count_after_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
  end

  def test_high_ranking_cards_after_removal
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    result = 1
    expected = deck.high_ranking_cards.count
    assert_equal result, expected
  end

  def test_percent_high_ranking_after_removal
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    assert_equal 50, deck.percent_high_ranking
  end

  def test_adds_new_card_to_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    result = 3
    expected = deck.cards.count
    assert_equal result, expected
  end

  def test_high_ranking_cards_after_addition_of_new_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    result = 1
    expected = deck.high_ranking_cards.count
    assert_equal result, expected
  end

  def test_percent_high_ranking_after_addition_of_new_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card
    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    result = 33.33
    expected = deck.percent_high_ranking

    assert_equal result, expected
  end

  def test_instance_of_player
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end
  def test_player_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_player_has_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert player.deck
  end

  def test_player_starts_not_losing
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    refute player.has_lost?
  end

  def test_remove_card_for_player
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal :diamond, player.deck.remove_card.suit
  end

  def test_player_did_not_lose_after_removing_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card

    refute player.has_lost?
  end

  def test_player_removed_another_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    assert_equal :spade, player.deck.remove_card.suit
  end

  def test_player_did_not_lose_after_removing_two_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card

    refute player.has_lost?
  end

  def test_player_removes_third_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card

    assert_equal :heart, player.deck.remove_card.suit
  end

  def test_player_did_not_lose_after_removing_three_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card

    refute player.has_lost?
  end

  def test_player_has_no_cards_left
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card

    assert_equal [], player.deck.cards
  end

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

  # def test_award_spoils_for_mutually_assured_destruction
  #   card1 = Card.new(:heart, 'Jack', 11)
  #   card2 = Card.new(:heart, '8', 8)
  #   card3 = Card.new(:heart, 'Jack', 11)
  #   card4 = Card.new(:diamond, 'Jack', 11)
  #   card5 = Card.new(:diamond, '7', 7)
  #   card6 = Card.new(:diamond, 'Jack', 11)
  #   deck1 = Deck.new([card1,card2,card3])
  #   deck2 = Deck.new([card4,card5,card6])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #   turn.winner
  #   turn.pile_cards
  #   assert_equal [], turn.spoils_of_war


  #add test case for player1 has too few cards
  #add test case for player1 has war at his last 2 or less
  # cards
end
