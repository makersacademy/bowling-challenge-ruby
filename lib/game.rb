class Game
  attr_reader :current_frame_obj, :current_frame_num, :all_frames
  def initialize
    @current_frame_obj
    @current_frame_num = 1
    @all_frames = []
  end

  def start_game
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end

  def end_frame
    @all_frames << @current_frame_obj
    @current_frame_num += 1
    @current_frame_obj = Frame.new(round: @current_frame_num)
  end
end