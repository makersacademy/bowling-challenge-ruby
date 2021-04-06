class Frame 

attr_reader :knocked_pins, :frame, :frame_id, :frame_score, :strike, :spare

  def initialize
    @frame_id = 0
    @frame = {}
  end

  def first_roll(knocked_pins1)
    @knocked_pins = knocked_pins1
    if knocked_pins == 10
       @frame = {frame_id: @frame_id += 1, first_roll: 'strike' }
    else
      @frame = {frame_id: @frame_id += 1, first_roll: knocked_pins1 }
    end
    over
  end

  def second_roll(knocked_pins2)
    @knocked_pins += knocked_pins2
    if @knocked_pins == 10
      @frame[:second_roll] = 'spare'
    else
      @frame[:second_roll] = knocked_pins2
    over
    end
  end
  
  def score
    

  end
  

  def over
    if @knocked_pins > 10 
       raise 'Wrong number - re-type!'
    end
  end
  
end


