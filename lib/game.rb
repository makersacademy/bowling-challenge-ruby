class Game
  attr_reader :frames

  def initialize
    @frames = []
  end

  def add_rolls(roll1, roll2)
    @frames << [roll1, roll2]
    raise 'Sum of the rolls cannot exceede 10' if [roll1, roll2].reduce(0, :+) > 10
  end

  def spare?(current_frame)
    !current_frame.nil? && current_frame.reduce(0,
                                                :+) == 10 && current_frame[0].positive? && current_frame[0] < 10
  end

  def strike?(current_frame)
    frame_exist = !current_frame.nil?
    frame_exist && current_frame[0] == 10 || frame_exist && current_frame[1] == 10
  end
end
