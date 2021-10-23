class Frame
  attr_reader :type

  def initialize
    @type = nil
  end

  def frame_type(first_roll, second_roll = 0)
    if first_roll + second_roll < 10
      @type = "Open"
    elsif first_roll == 10
      @type = "Strike"
    else first_roll + second_roll == 10
      @type = "Spare"     end
  end
end
