# frozen_string_literal: true

class Bowlinggame
  def initialize
    @rolls = []
  end

  def roll(pin)
    @rolls << pin
  end

  def score
    score_counter = 0
    rollindex = 0
    # rollIndex - count the number in the array
   10.times do
      if @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i == 10
        score_counter += @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i + @rolls[rollindex + 2].to_i

      else
       score_counter += @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i
      end
      rollindex += 2
    end
    score_counter
  end

  # def spare?(rolli)
  # def spare

  # end
end
