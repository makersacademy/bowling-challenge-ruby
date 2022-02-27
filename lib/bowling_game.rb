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
      if spare?(rollindex)
        score_counter += spare_score(rollindex)

      else
       score_counter += overall_score(rollindex)
      end
      rollindex += 2
    end
    score_counter
  end

  def spare?(rollindex)
  
    @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i == 10

  end

  def spare_score(rollindex)
    @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i + @rolls[rollindex + 2].to_i
  end

def overall_score(rollindex)
  @rolls[rollindex].to_i + @rolls[rollindex + 1].to_i
end



end
