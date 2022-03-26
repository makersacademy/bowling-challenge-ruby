# frozen_string_literal: true

class Game
  attr_reader :total_frames, :current_frame, :current_frame_number

  def initialize
    @total_frames = []
    @current_frame
    @current_frame_number
  end

  def game_start
    @current_frame_number = 1
    @current_frame = Frame.new(frame: @current_frame_number)
  end
end
