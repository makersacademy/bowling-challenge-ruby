# frozen_string_literal: true

require_relative 'scorecard'

class Game
  attr_reader :scorecard

  def initialize
    @frame_number = 1
    @frames = []
    @scorecard = []
  end

  def play
    turn until @frame_number == 11
    @frames << [roll] if @frames[-1].sum == 10
    @frames << [roll] if @frames[-2][0] == 10
    scoring(@frames)
    return @scorecard
  end

  private

  def scoring(scores)
    frame = 1
    scores.each do |score|
      break if frame == 11
      result = 0
      if strike?(score)
        result += 10
        strike?(scores[frame]) ? result += 10 + scores[frame + 1][0] : result += scores[frame].sum
      elsif spare?(score)
        result += 10
        result += scores[frame][0]
      else
        result += score.sum
      end
      @scorecard << result
      frame += 1
    end
    @scorecard
  end

  def strike?(score)
    score[0] == 10
  end

  def spare?(score)
    score.sum == 10
  end

  def turn
    score1 = roll
    if score1 == 10
      @frames << [score1]
    else
      score2 = roll
      @frames << [score1, score2]
    end
    @frame_number += 1
  end

  def roll
    gets.chomp.to_i
  end
end
