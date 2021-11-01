class Game

  require_relative 'score'

  attr_reader :frames

  def initialize
    @frames = Array.new(10){ [] }
    @frame_number = 1
    @roll_number = 1
    @score = Score.new
  end

  def roll(pins)
    if @frame_number < 10
      if pins < 10 && @roll_number == 1
        @frames[@frame_number -1] << pins
        @roll_number = 2
      elsif pins < 10 && @roll_number == 2
        @frames[@frame_number -1] << pins
        @frame_number += 1
        @roll_number = 1
      else
        @frames[@frame_number -1] << pins
        @frame_number += 1
      end
    else
      @frames[9] << pins
    end
  end

  def score
    @score.game_total(frames)
  end

end

# test @frames =  [[1,4],[4,5],[6,4],[5,5],[10],[0,1],[7,3],[6,4],[10],[2,8,6]] 