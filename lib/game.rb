class Game

  attr_reader :throws

  def initialize()
    @throws = []
    @frame_finished = true
  end

  def add(pins)
    @throws << pins

  end

  def frame_finished?
    @frame_finished
  end

  def frame_state(pins)
    @frame_finished = !@frame_finished if pins != 10
  end

end
