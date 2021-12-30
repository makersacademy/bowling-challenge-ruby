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
    i = 0
    10.times do
      if roll_list[i] + roll_list[i+1] == 10
        sum += roll_list[i] + roll_list[i+1] + roll_list[i+2] # frame1_roll1 + frame1_roll2 + frame2_roll1(bonus)
        i += 2 # move to next frame
      else
        sum +=  roll_list[i] + roll_list[i+1]
        i += 2 # move to next frame
      end
    end
    sum
  end
end