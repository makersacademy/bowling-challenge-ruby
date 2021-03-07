require 'frame'

class Game
  attr_reader :frames_finished

  def initialize(frame = Frame.new)
    @frames_finished = []
    @frame = frame
    @bonus_points = 0
    @points = 0
  end

  def take_new_frame
    @frames_finished << @frame.frame_result
    @points += @frames_finished[0][-1][:roll_one]
    @points += @frames_finished[0][-1][:roll_two]

    @frames_finished[0][-1]
  end

  def check_frame_for_strike(frame)
    frame[:roll_one].include?('10') ? true : false
  end

  def check_frame_for_spares(frame)
    frame[:roll_one].to_i + frame[:roll_two].to_i == 10 ? true : false
    
  end


  def bonus_points
    if check_frame_for_spares(@frames_finished[0][-1]) == true
      new_frame = take_new_frame
      if check_frame_for_spares(new_frame)

    check_frame_for_strike(@frames_finished[0][-1])

    take_new_frame
end




  private
  def last_frame?
    @frames_finished.count == 9 ? true : false
  end


end
