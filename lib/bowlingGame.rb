class BowlingGame
  attr_reader :roll_list
  def initialize(roll_list = [])
    @roll_list = roll_list
  end

  def roll(num)
    @roll_list.push(num)
  end

  def outcome
    sum = 0
    @index = 0
    10.times do
      if roll_list[@index] == 10 
        sum += roll_list[@index] + roll_list[@index+1] + roll_list[@index+2] # frame1_roll1 + frame2_roll1 + frame2_roll2
        @index += 1 # move to next frame (there is no frame1_roll2 for a stike)
      elsif spare?
        sum += spare_score
        @index += 2 # move to next frame
      else
        sum +=  roll_list[@index] + roll_list[@index+1]
        @index += 2 # move to next frame
      end
    end
    sum
  end

  def spare?
    roll_list[@index] + roll_list[@index+1] == 10
  end

  def spare_score
    roll_list[@index] + roll_list[@index+1] + roll_list[@index+2]
  end
  
end