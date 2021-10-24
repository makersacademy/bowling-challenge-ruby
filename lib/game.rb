# frozen_string_literal: true

class Game
  attr_accessor :rolls

  def initialize
    @rolls = []
    @total_score = 0
  end

  def roll(num)
    @rolls << num
  end

  def score
    total_score  = 0
    frame = 0
    while frame < @rolls.size - 1 #.size returns the number of elements in the set
      # roll = @rolls[frame]
      # next_roll = @rolls[frame+ 1]
      if strike?(frame) && frame <= 9
        total_score += 10 + strike_bonus(frame)
        frame += 1
      elsif spare?(frame) #roll + next_roll == 10 #spare
        total_score += 10 + spare_bonus(frame)
        frame += 2
      else #not a spare or strike 
        total_score += regular_scoring(frame)
        frame += 2
      end
  end 
    total_score
  end

  def strike?(frame)
      @rolls[frame] == 10
  end

  def spare?(frame)
    @rolls[frame] + @rolls[frame + 1] == 10
  end 

  def regular_scoring(frame)
    @rolls[frame] + @rolls[frame + 1] 
  end 

  def strike_bonus(frame)
    @rolls[frame + 1] + @rolls[frame + 2]
  end 

  def spare_bonus(frame)
    @rolls[frame + 2] #frame and frame+1 has already been added with (10)
  end 

  # def final_frame(frame)
  #   @rolls[10]
  # end
end 
