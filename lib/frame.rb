class Frame 
    attr_reader :roll_1, :roll_2, :end_of_frame
    attr_accessor :frame_total


  def initialize
    @roll_1 = nil
    @roll_2 = nil
    @end_of_frame = false
    @frame_total = nil
  end

  def frame_number
    
  end

  # def turn
  #   unless @end_of_frame?
  #     puts "Frame number #{frame_number}"
  #   end
  # end
end