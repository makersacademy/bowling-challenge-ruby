class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_rolls(roll1, roll2, bonus_roll = 0)
    max_ten_pins(roll1, roll2)
    @frames << if last_frame? && spare?([roll1, roll2]) || last_frame? && strike?([roll1, 0])
                 [roll1, roll2, bonus_roll]
               else
                 [roll1, roll2]
               end
  end

  def spare?(current_frame)
    first_roll = current_frame[0]
    !current_frame.nil? && current_frame.reduce(0,
                                                :+) == 10 && first_roll.positive? && first_roll < 10
  end

  def strike?(current_frame)
    frame_exist = !current_frame.nil?
    frame_exist && current_frame[0] == 10 || frame_exist && current_frame[1] == 10
  end

  def max_ten_pins(roll1, roll2)
    raise 'Sum of the rolls cannot exceede 10' if [roll1, roll2].reduce(0, :+) > 10 && !last_frame?
  end

  def last_frame?
    @frames.count == 9
  end
end
