require 'frame'

class Game

  attr_reader :total_score

  def initialize
    @frame_number = 1
    @all_rolls = []
    @strikes = []
    @spares = []
    @total_score = 0
    @score_by_frame = []
  end

  def run
    
    loop do
      frame = Frame.new(@frame_number)
      frame.run
      @frame_number += 1
      record_frame(frame)
      break if @frame_number == 11
    end
    p self
    @frame_number = 0
    loop do
      calculate_total_by_frame
      p @score_by_frame
      @frame_number += 1
      break if @frame_number == 10
    end
    calculate_total
    
    
  end

  def record_frame(frame)
    rolls = []
    rolls << frame.roll_1
    rolls << frame.roll_2 if frame.roll_2 != nil
    @all_rolls << rolls
    @strikes << frame.strike?
    @spares << frame.spare?
  end

  def calculate_total
    total = 0
    @score_by_frame.each do |score|     
      total += score
    end
    @total_score = total
  end

  def calculate_total_by_frame
    frame_score = 0
    case
    when @strikes[@frame_number] == true
      frame_score += 10
      frame_score += @all_rolls[@frame_number+1][0]
      if @all_rolls[@frame_number+1][1]
        frame_score += @all_rolls[@frame_number+1][1]
      else
        frame_score += @all_rolls[@frame_number+2][0]
      end
    when @spares[@frame_number] == true
      frame_score += 10
      frame_score += @all_rolls[@frame_number+1][0]
    else
      p "Trying to calculate"
      frame_score += @all_rolls[@frame_number][0] + @all_rolls[@frame_number][1]
    end
    @score_by_frame[@frame_number] = frame_score
  end

  private
end
