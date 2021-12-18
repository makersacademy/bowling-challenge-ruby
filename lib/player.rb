class Player

  attr_reader :name, :current_frame

  def initialize(name)
    @name = name
    @current_frame = 1
  end
end