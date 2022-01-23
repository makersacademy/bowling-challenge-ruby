# frozen_string_literal: true

require_relative 'scorecard'
require_relative 'frame'
require_relative 'messages'

class Game
  attr_reader :frames, :frame_number

  include Messages

  def initialize
    @frame_number = 1
    @frames = []
  end

  def play
    reset_game
    turn until frame_number == 11
    bonus_roll if bonus?(@frames.last)
    Scorecard.new(@frames)
  end

  private

  def turn
    p frame_message
    p message1
    score1 = roll
    raise pins_error if score1 > 10

    if score1 == 10
      @frames << Frame.create([@frame_number, score1])
      p strike_message
    else
      p message2
      score2 = roll
      raise pins_error if score1 + score2 > 10

      @frames << Frame.create([@frame_number, score1, score2])
    end
    @frame_number += 1
  end

  def bonus?(frame)
    frame[:roll1] == 10 || frame[:roll1] + frame[:roll2] == 10
  end

  def bonus_roll
    p bonus_roll_message
    score = roll
    raise pins_error if score > 10

    @frames << Frame.create([:bonus_roll, score])
  end

  def roll
    gets.chomp.to_i
  end

  def reset_game
    @frame_number = 1
    @frames = []
  end
end
# game = Game.new
# game.play