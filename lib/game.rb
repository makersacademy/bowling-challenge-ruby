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
    scoring
    return @scorecard
    reset
  end

  private

  def reset
    @frame_number = 1
    @frames = []
    @scorecard = []
  end

  def scoring
    frame = 1
    @frames.each do |score|
      break if frame == 11
      result = 0
      case roll_type(score)
      when 'strike'
        result += 10
        strike?(@frames[frame]) ? result += 10 + @frames[frame + 1][0] : result += @frames[frame].sum
      when 'spare'
        result += 10
        result += @frames[frame][0]
      when 'normal'
        result += @score.sum
      end
      @scorecard << result
      frame += 1
    end
    @scorecard << @scorecard.sum
  end

  def strike?(score)
    score[0] == 10
  end

  def spare?(score)
    score.sum == 10
  end

  def roll_type(score)
    if strike?(score)
      roll_type = 'strike'
    elsif spare?(score)
      roll_type = 'spare'
    else
      roll_type = 'normal'
    end
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
