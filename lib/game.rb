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
    turn until frame_number == 10
    last_turn
    @frames
    # Scorecard.new(@frames)
  end

  private

  def turn
    p frame_message
    p message1
    score1 = roll
    if score1 == 10
      @frames << Frame.create([@frame_number, score1])
      p strike_message
    else
      p message2
      score2 = roll
      p spare_message if score1 + score2 == 10
      @frames << Frame.create([@frame_number, score1, score2])
    end
    @frame_number += 1
  end

  def last_turn
    p last_frame_message
    p message1
    score1 = roll
    if score1 == 10
      p strike_message
      p message2
      score2 = roll
      @frames << Frame.create([@frame_number, score1, score2])
    else
      p message3
      score3 = roll
      @frames << Frame.create([@frame_number, score1, score2])
    end
  end

  def roll
    gets.chomp.to_i
  end
end
