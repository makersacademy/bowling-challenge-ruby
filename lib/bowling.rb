# frozen_string_literal: true

class Bowling
  attr_reader :turn, :roll, :rolls, :strikes

  def initialize
    @turn = 1
    @roll = 1
    @rolls = {}
    @strikes = {}
  end

  def input(score)
    turn_check
    if (1..10).include? score
      rolling(score)
    else
      raise 'Not a valid score!'
    end
    turn_check
    score
  end

  def turn_check
    if @turn == 11
      end_game
    end
  end

  def rolling(score)
    case @roll
    when 1
      roll_one(score)
    when 2
      roll_two(score)
    end
    score
  end

  def roll_two(score)
    first_roll = @rolls[@turn]
    if (first_roll[0] + score.to_i) > 10
      raise 'Not a valid score!'
    else
      if (first_roll[0] + score.to_i) == 10
        @strikes[@turn] = "/"
      end
      @rolls[@turn] = [first_roll[0], score]
      @roll = 1
      @turn += 1
    end
  end

  def roll_one(score)
    @rolls[@turn] = [score]
    if score == 10
      @strikes[@turn] = "X"
      @turn = 2
    else
      @roll = 2
    end
  end

  def current_score
    5
  end

  def end_game
    puts 'Thank you for playing! Your score is:'
    return current_score
  end
end
