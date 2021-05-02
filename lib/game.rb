# frozen_string_literal: true

require_relative 'scorecard'

class Game
  attr_reader :scorecard

  def initialize(input)
    @scorecard = input[:scorecard]
  end

  def self.begin_game(game)
    @game = game
  end

  def self.load_game
    @game
  end

  def bowl(score)
    @scorecard.add_score(score)
    game_over if @scorecard.game_over?
  end

  def score
    @scorecard.calculate_score
  end

  def game_over #put game over summary stuff in here
    return "Game over. You scored: #{@scorecard.calculate_score}! 
    Here is your scorecard: #{@scorecard.scorecard}"
  end
end
