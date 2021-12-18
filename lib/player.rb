class Player

  attr_reader :name, :current_frame

  def initialize(name)
    @name = name
    @current_frame = 1
    @current_roll = 1
  end

  def pins_knocked_down(number, points)
    points.update_roll(@current_frame, @current_roll, number)
    update_frame_and_roll_return_score(number, points)
  end

  private

  def update_frame_and_roll_return_score(number, points)
    if @current_roll == 1
      @current_roll += 1
      number
    elsif @current_roll == 2
      @current_roll -= 1
      @current_frame += 1
      points.current_score
    end
  end
end