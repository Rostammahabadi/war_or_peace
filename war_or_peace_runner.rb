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
# if start_game != "GO"
#   p "You did not start the game, type GO to begin"
#   return
# end

class Game
  attr_reader :player1_cards, :player2_cards
  def initialize()
    @player1_cards = []
    @player2_cards = []
  end

  def create_cards
    all_cards = []
    all_cards << Card.new("Spades", "Ace", 14)
    all_cards << Card.new("Spades", "King", 13)
    all_cards << Card.new("Spades", "Queen", 12)
    all_cards << Card.new("Spades", "Jack", 11)
    all_cards << Card.new("Heart", "Ace", 14)
    all_cards << Card.new("Heart", "King", 13)
    all_cards << Card.new("Heart", "Queen", 12)
    all_cards << Card.new("Heart", "Jack", 11)
    all_cards << Card.new("Heart", "10", 10)
    all_cards << Card.new("Heart", "9", 9)
    all_cards << Card.new("Heart", "8", 8)
    all_cards << Card.new("Heart", "7", 7)
    all_cards << Card.new("Heart", "6", 6)
    all_cards << Card.new("Heart", "5", 5)
    all_cards << Card.new("Heart", "4", 4)
    all_cards << Card.new("Heart", "3", 3)
    all_cards << Card.new("Heart", "2", 2)
    all_cards << Card.new("Spades", "10", 10)
    all_cards << Card.new("Spades", "9", 9)
    all_cards << Card.new("Spades", "8", 8)
    all_cards << Card.new("Spades", "7", 7)
    all_cards << Card.new("Spades", "6", 6)
    all_cards << Card.new("Spades", "5", 5)
    all_cards << Card.new("Spades", "4", 4)
    all_cards << Card.new("Spades", "3", 3)
    all_cards << Card.new("Spades", "2", 2)
    all_cards << Card.new("Diamond", "Ace", 14)
    all_cards << Card.new("Diamond", "King", 13)
    all_cards << Card.new("Diamond", "Queen", 12)
    all_cards << Card.new("Diamond", "Jack", 11)
    all_cards << Card.new("Diamond", "10", 10)
    all_cards << Card.new("Diamond", "9", 9)
    all_cards << Card.new("Diamond", "8", 8)
    all_cards << Card.new("Diamond", "7", 7)
    all_cards << Card.new("Diamond", "6", 6)
    all_cards << Card.new("Diamond", "5", 5)
    all_cards << Card.new("Diamond", "4", 4)
    all_cards << Card.new("Diamond", "3", 3)
    all_cards << Card.new("Diamond", "2", 2)
    all_cards << Card.new("Club", "Ace", 14)
    all_cards << Card.new("Club", "King", 13)
    all_cards << Card.new("Club", "Queen", 12)
    all_cards << Card.new("Club", "Jack", 11)
    all_cards << Card.new("Club", "10", 10)
    all_cards << Card.new("Club", "9", 9)
    all_cards << Card.new("Club", "8", 8)
    all_cards << Card.new("Club", "7", 7)
    all_cards << Card.new("Club", "6", 6)
    all_cards << Card.new("Club", "5", 5)
    all_cards << Card.new("Club", "4", 4)
    all_cards << Card.new("Club", "3", 3)
    all_cards << Card.new("Club", "2", 2)

    all_cards.shuffle
    # suits = %i[Spade Club Diamond Heart]
    # ranks = [14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2]
    # values = ["Ace", "King", "Queen", "Jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
  end

  # def split_cards
  #   all_cards = create_cards
  #   @player1_cards = all_cards[0..26]
  #   @player2_cards = all_cards[26..52]
  # end

  # def start(start)
  #     create_cards
  #     split_cards
  #
  # end

  def new_deck
    deck_of_cards = create_cards
    deck = Deck.new(deck_of_cards)
  end

  def split_deck
    all_cards = create_cards
    @player1_cards = all_cards[0..26]
    @player2_cards = all_cards[26..52]
  end

  def create_player1
    player1 = Player.new("June", @player1_cards)
  end

  def create_player2
    player2 = Player.new("August", @player2_cards)
  end

  def setup_turns
    player_2 = create_player2
    player_1 = create_player1
    turn1 = Turn.new(player_1, player_2)
    turn1.type
    p turn1.winner
    turn1.pile_cards
    turn1.award_spoils
    binding.pry
  end

end

game = Game.new
game.create_cards
game.new_deck
game.split_deck
game.create_player1
game.create_player2
game.setup_turns
