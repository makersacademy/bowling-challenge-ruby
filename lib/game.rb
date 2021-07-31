class Game
  attr_reader :current_frame_obj, :current_frame_num, :all_frames
  def initialize
    @current_frame_obj
    @current_frame_num = 1
    @all_frames = []
  end
end