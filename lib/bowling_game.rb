# frozen_string_literal: true

class BowlingGame
  attr_reader :scorecard, :frame

  def initialize(scorecard = [])
    @scorecard = scorecard
    @frame = []
  end

  def add_roll(roll)
    @frame << roll
    add_to_scorecard
  end

  def score
    score = index = 0

    @scorecard.each do |frame|
      if strike?(frame)
        score += @scorecard.flatten[index] + @scorecard.flatten[index + 1] + @scorecard.flatten[index + 2]
        index += 1
      elsif spare?(frame)
        score += @scorecard.flatten[index] + @scorecard.flatten[index + 1] + @scorecard.flatten[index + 2]
        index += 2
      else
        score += frame.sum
        index += 2
      end
    end
    score
  end

  def strike?(frame)
    frame.any? { |n| n == 10 }
  end

  def spare?(frame)
    frame.sum == 10
  end

  private

  def add_to_scorecard
    if @scorecard.length < 9
      if strike?(@frame) || @frame.length == 2
        @scorecard << @frame
        @frame = []
      end

    elsif @scorecard.length == 9
      if !strike?(@frame) && !spare?(@frame) && @frame.length == 2
        @scorecard << @frame
        @frame = []

      elsif @frame.length == 3
        @scorecard << @frame
        @frame = []
      end
    end
  end
end
