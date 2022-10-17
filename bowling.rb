# frozen_string_literal: true

class Bowling
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    rollIndex = 1
    puts "Please enter the score from your first roll from round #{rollIndex}"
    @roll_1 = gets.chomp.to_i
    10.times do
      if strike?(rollIndex)
        result += strike_score(rollIndex)
        rollIndex += 1

      elsif spare?(rollIndex)
        result += spare_score(rollIndex)
        rollIndex += 2
      else
        result += frame_score(rollIndex)
        rollIndex += 2
      end
    end
    result
  end

  def strike?(rollIndex)
    @rolls[rollIndex] == 10
  end

  def strike_score(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1] + @rolls[rollIndex + 2]
  end

  def spare?(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1] == 10
  end

  def spare_score(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex + 1]
  end

  def frame_score(rollIndex)
    @rolls[rollIndex] + @rolls[rollIndex]
  end

  def closing_statement
    puts "Thanks for playing. Your total score was #{@scorecard}"
    exit
  end
end

bowl = Bowling.new
bowl.score
