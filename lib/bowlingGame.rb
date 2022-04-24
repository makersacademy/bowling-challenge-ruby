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
      if strike?
        sum += strike_pts
        @index += 1 # move to next frame (there is no frame1_roll2 for a stike)
      elsif spare?
        sum += spare_pts
        @index += 2 # move to next frame (i+1 = frame1_roll2, i+2 = frame2_roll1)
      else
        sum += two_rolls_pts
        @index += 2 # move to next frame
      end
    end
    sum
  end

  def strike?
    roll_list[@index] == 10 
  end

  def strike_pts
    roll_list[@index] + roll_list[@index+1] + roll_list[@index+2]
  end

  def spare?
    roll_list[@index] + roll_list[@index+1] == 10
  end

  def spare_pts
    roll_list[@index] + roll_list[@index+1] + roll_list[@index+2]
  end

  def two_rolls_pts
    roll_list[@index] + roll_list[@index+1]
  end
end
