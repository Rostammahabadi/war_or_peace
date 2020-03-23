require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'
p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"

start_game = gets.chomp

class Game
  def initialize()
  end

  def create_cards
    all_cards = []
    all_cards << Card.new(:Spades, "Ace", 14)
    all_cards << Card.new(:Spades, "King", 13)
    all_cards << Card.new(:Spades, "Queen", 12)
    all_cards << Card.new(:Spades, "Jack", 11)
    all_cards << Card.new(:Heart, "Ace", 14)
    all_cards << Card.new(:Heart, "King", 13)
    all_cards << Card.new(:Heart, "Queen", 12)
    all_cards << Card.new(:Heart, "Jack", 11)
    all_cards << Card.new(:Heart, "10", 10)
    all_cards << Card.new(:Heart, "9", 9)
    all_cards << Card.new(:Heart, "8", 8)
    all_cards << Card.new(:Heart, "7", 7)
    all_cards << Card.new(:Heart, "6", 6)
    all_cards << Card.new(:Heart, "5", 5)
    all_cards << Card.new(:Heart, "4", 4)
    all_cards << Card.new(:Heart, "3", 3)
    all_cards << Card.new(:Heart, "2", 2)
    all_cards << Card.new(:Spades, "10", 10)
    all_cards << Card.new(:Spades, "9", 9)
    all_cards << Card.new(:Spades, "8", 8)
    all_cards << Card.new(:Spades, "7", 7)
    all_cards << Card.new(:Spades, "6", 6)
    all_cards << Card.new(:Spades, "5", 5)
    all_cards << Card.new(:Spades, "4", 4)
    all_cards << Card.new(:Spades, "3", 3)
    all_cards << Card.new(:Spades, "2", 2)
    all_cards << Card.new(:Diamond, "Ace", 14)
    all_cards << Card.new(:Diamond, "King", 13)
    all_cards << Card.new(:Diamond, "Queen", 12)
    all_cards << Card.new(:Diamond, "Jack", 11)
    all_cards << Card.new(:Diamond, "10", 10)
    all_cards << Card.new(:Diamond, "9", 9)
    all_cards << Card.new(:Diamond, "8", 8)
    all_cards << Card.new(:Diamond, "7", 7)
    all_cards << Card.new(:Diamond, "6", 6)
    all_cards << Card.new(:Diamond, "5", 5)
    all_cards << Card.new(:Diamond, "4", 4)
    all_cards << Card.new(:Diamond, "3", 3)
    all_cards << Card.new(:Diamond, "2", 2)
    all_cards << Card.new(:Club, "Ace", 14)
    all_cards << Card.new(:Club, "King", 13)
    all_cards << Card.new(:Club, "Queen", 12)
    all_cards << Card.new(:Club, "Jack", 11)
    all_cards << Card.new(:Club, "10", 10)
    all_cards << Card.new(:Club, "9", 9)
    all_cards << Card.new(:Club, "8", 8)
    all_cards << Card.new(:Club, "7", 7)
    all_cards << Card.new(:Club, "6", 6)
    all_cards << Card.new(:Club, "5", 5)
    all_cards << Card.new(:Club, "4", 4)
    all_cards << Card.new(:Club, "3", 3)
    all_cards << Card.new(:Club, "2", 2)

    all_cards.shuffle
  end

  def create_player1
    player1 = Player.new("Megan", Deck.new(create_cards[0..26]))
  end

  def create_player2
    player2 = Player.new("Aurora", Deck.new(create_cards[26..52]))
  end

  def setup_turns
    player2 = create_player2
    player1 = create_player1
    x = 1
      while x != 1000000
        turn = Turn.new(player1, player2)
        turn.type
        turn.winner
        turn.pile_cards
        if player1.deck.cards.length > 0 && player2.deck.cards.length > 0
          winner = turn.winner
          turn.award_spoils(winner)
          p "Turn #{x}: #{turn.type} #{turn.winner.name}"
        else
          return "Game has ended"
        end
        x+=1
      end
  end


end

game = Game.new
game.create_cards
game.create_player1
game.create_player2
game.setup_turns
