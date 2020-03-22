require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require_relative 'war_or_peace_runner'
require 'pry'

class CardTest < Minitest::Test

  def test_create_cards
    game = Game.new

    assert_equal 52, game.create_cards.length

  end

  def test_split_cards
    game = Game.new
    game.create_cards
    assert_equal 26, game.split_cards.length
  end


end
