class Bowling
  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def frame(roll_one, roll_two = 'strike')
    @rolls << if roll_one == 10
                { first: roll_one }
              else
                { first: roll_one, second: roll_two }
              end
  end

  def tenth_frame(roll_one, roll_two, roll_three = 'no strike or spare')
    @rolls << if roll_three == 'no strike or spare'
                { first: roll_one, second: roll_two }
              else
                { first: roll_one, second: roll_two, third: roll_three }
              end
  end
end
