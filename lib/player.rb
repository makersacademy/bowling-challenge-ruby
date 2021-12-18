class Player

  attr_reader :name, :current_frame

  def initialize(name)
    @name = name
    @current_frame = 1
    @current_roll = 1
  end

  def pins_knocked_down(number, points)
    points.update_roll(@current_frame, @current_roll, number)
  end
end