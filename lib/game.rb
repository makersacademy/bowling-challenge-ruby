require 'frame'

class Game
  attr_reader :frames_finished

  def initialize(frame = Frame.new)
    @frames_finished = []
    @frame = frame
  end

  def take_new_frame
    @frames_finished << @frame.frame_result
  end

  def check_frame_for_strike
    @frames_finished[0][-1][:roll_one].include?('10') ? true : false
  end

  def check_frame_for_spares
    @frames_finished[0][-1][:roll_one].include?('5') && @frames_finished[0][-1][:roll_two].include?('5') ? true : false
  end

  


  private
  def last_frame?
    @frames_finished.count == 9 ? true : false
  end


end
