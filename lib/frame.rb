class Frame

  FRAME_ID_MIN = 1
  FRAME_ID_MAX = 10
  ERROR_MESSAGE = 'Not a valid frame number'
  DEFAULT_FRAME = {  
    1 => nil,
    2 => nil,
    spare: nil,
    strike: nil
  }

  attr_reader :frame

  def initialize(frame_id)
    raise ERROR_MESSAGE if invalid?(frame_id, FRAME_ID_MIN, FRAME_ID_MAX)

    @frame = DEFAULT_FRAME
    @frame[:frame] = frame_id
    @frame[3] = nil if frame_id == 10
  end

  private

  def invalid?(number, min, max)
    return true unless number.is_a? Integer

    number < min || number > max
  end

end
