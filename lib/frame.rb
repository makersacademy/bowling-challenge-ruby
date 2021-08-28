class Frame

  FRAME_ID_MIN = 1
  FRAME_ID_MAX = 10
  ERROR_MESSAGE = 'Not a valid frame number'
  DEFAULT_FRAME = {  
    1 => nil,
    spare: nil,
    strike: nil
  }

  attr_reader :frame

  def initialize(frame_id, check = Validity.new)
    raise ERROR_MESSAGE unless check.valid?(frame_id, FRAME_ID_MIN, FRAME_ID_MAX)

    @frame = DEFAULT_FRAME
    @frame[:frame] = frame_id
  end

end
