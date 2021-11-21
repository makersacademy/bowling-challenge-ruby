# frozen_string_literal: true

# This class stores information for a specific frame
class Frame
  attr_reader :first_bowl, :second_bowl
  
  def initialize(frame)
    @first_bowl = frame.first
    @second_bowl = frame.last
  end

  def sum
    @first_bowl + @second_bowl
  end
end
