# frozen_string_literal: true

require_relative 'frame'

class Scorecard

  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_frame(roll1, roll2, roll3 = 0)
    if @frames.size < 9
      raise InvalidScoreError if score_invalid?(roll1, roll2)

      frame = Frame.new(roll1: roll1, roll2: roll2)

      @frames << { "frame #{@frames.size + 1}" => {
        'roll1' => frame.roll1, 'roll2' => frame.roll2
      } }
    else
      unless game_over?
        raise InvalidScoreError if final_frame_score_invalid?(roll1, roll2, roll3)
        @frames << { 'frame 10' => { 'roll1' => roll1,
                                     'roll2' => roll2, 'roll3' => roll3 } }
      end
    end
  end

  private

  def score_invalid?(roll1, roll2)
    roll1 + roll2 > 10 || (roll1 + roll2).negative?
  end

  def final_frame_score_invalid?(roll1, roll2, roll3)
    roll1 + roll2 + roll3 > 30 || (roll1 + roll2 + roll3).negative? || roll3 > 0 && (roll1 + roll2) < 10
  end

  def game_over?
    @frames.length == 10
  end
end

class InvalidScoreError < StandardError
end
