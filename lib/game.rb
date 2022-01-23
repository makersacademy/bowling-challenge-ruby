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
    turn until frame_number == 11
    bonus_roll if bonus?(@frames.last)
  end

  private

  def turn
    frame_message
    message1
    score1 = roll
    if score1 == 10
      @frames << Frame.create([@frame_number, score1])
      strike_message
    else
      message2
      score2 = roll
      spare_message if score1 + score2 == 10
      @frames << Frame.create([@frame_number, score1, score2])
    end
    @frame_number += 1
  end


  def bonus?(frame)
    frame[:roll1] == 10 || frame[:roll1] + frame[:roll2] == 10
  end

  def bonus_roll
    bonus_roll_message
    score = roll
    @frames << Frame.create([:bonus_roll, score])
  end

  def roll
    gets.chomp.to_i
  end
end
