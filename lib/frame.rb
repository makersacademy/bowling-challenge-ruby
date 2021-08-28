require_relative 'validity'

class Frame

  FRAME_ID_MIN = 1
  FRAME_ID_MAX = 10
  ERROR_MESSAGE = 'Not a valid frame number'
  DEFAULT_FRAME = {  
    1 => nil,
    spare: nil,
    strike: nil
  }

  attr_reader :content

  def initialize(frame_id, check = Validity.new)
    raise ERROR_MESSAGE unless check.valid?(frame_id, FRAME_ID_MIN, FRAME_ID_MAX)

    @content = DEFAULT_FRAME
    @content[:frame] = frame_id
  end

  def add(roll)
    content[1] = roll
  end

end
