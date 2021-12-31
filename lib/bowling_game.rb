# frozen_string_literal: true

class BowlingGame
  attr_reader :scorecard

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
      if strike?(frame) || spare?(frame) 
        # In either case we need to add up a total of 3 rolls
        score += @scorecard.flatten[index] + @scorecard.flatten[index + 1] + @scorecard.flatten[index + 2]
      else
        score += frame.sum
      end
      index += advance_index(frame)
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

  def advance_index(frame) 
    # If the current frame is an strike the next frame is just the next roll or else its in 2 rolls
    strike?(frame) ? 1 : 2
  end 

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
