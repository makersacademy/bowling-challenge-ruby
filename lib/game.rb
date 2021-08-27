require_relative 'frame'

class Game 
  attr_reader :total_score, :frames, :rolls

  def initialize
    @total_score = 0
    @frames = []
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
    open_frames
  end
  
  def open_frames
    if @frames.length == 0 || @frames.last.finished == true
      @frames << Frame.new
    end
  end
end