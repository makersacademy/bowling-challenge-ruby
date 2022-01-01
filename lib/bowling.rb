# frozen_string_literal: true

require_relative 'calculator'

class Bowling
  attr_reader :turn, :roll, :rolls, :strikes

  def initialize(calculator = Calculator.new)
    @turn = 1
    @roll = 1
    @rolls = {}
    @strikes = {}
    @calculator = calculator
  end

  def input(score)
    unless @turn > 10
      if (1..10).include? score
        rolling(score)
      else
        raise 'Not a valid score!'
      end
      turn_check
      score
    end
  end

  def turn_check
    end_game if @turn > 10
  end

  def rolling(score)
    if @turn == 10
      turn_ten(score)
    else
      case @roll
      when 1
        roll_one(score)
      when 2
        roll_two(score)
      end
    end
  end

  def roll_two(score)
    first_roll = @rolls[@turn]
    if (first_roll[0] + score.to_i) > 10
      raise 'Not a valid score!'
    else
      @strikes[@turn] = '/' if (first_roll[0] + score.to_i) == 10
      @rolls[@turn] = [first_roll[0], score]
      @roll = 1
      @turn += 1
    end
  end

  def roll_one(score)
    @rolls[@turn] = [score]
    if score == 10
      @strikes[@turn] = 'X'
      if @turn != 10
        @turn += 1
      else
        @roll = 2
      end
    else
      @roll = 2
    end
  end

  def current_score
    @calculator.calculate_score(@rolls, @strikes, @turn)
  end

  def end_game
    puts 'Thank you for playing! Your score is:'
    current_score
  end

  def turn_ten(score)
    case @roll
    when 1
      roll_one(score)
    when 2
      roll_two_turn_ten(score)
    when 3
      roll_three(score)
    end
  end

  def roll_two_turn_ten(score)
    first_roll = @rolls[@turn][0]
    if ((first_roll + score.to_i) > 10) && (first_roll != 10)
      raise 'Not a valid score!'
    elsif first_roll == 10 || first_roll + score.to_i == 10
      @rolls[@turn] = [first_roll, score]
      @roll = 3
    else
      @roll = 1
      @rolls[@turn] = [first_roll, score]
      @turn += 1
    end
  end

  def roll_three(score)
    first_roll = @rolls[@turn][0]
    second_roll = @rolls[@turn][1]
    if @strikes[@turn] == 'X' && ((second_roll + score.to_i) > 10) && second_roll != 10
      raise 'Not a valid score!'
    else
      @rolls[@turn] = [first_roll, second_roll, score]
      @roll = 1
      @turn += 1
    end
  end
end
