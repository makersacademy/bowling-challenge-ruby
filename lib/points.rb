class Points

  attr_reader :total, :frames

  def initialize
    @total = 0

    @frames = [] 

    frame_hash = {
      roll_1: 0,
      roll_2: 0,
      bonus: []
    }
    
    10.times { @frames << frame_hash }
  end
end