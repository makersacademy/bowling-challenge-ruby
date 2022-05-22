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
    request_user_input_first_10_frames
    calculate_all_frame_totals
    calculate_total
  end

  private

  def request_user_input_first_10_frames
    loop do
      frame = Frame.new(@frame_number)
      frame.run
      @frame_number += 1
      record_frame(frame)
      break if @frame_number == 11
    end
  end

  def record_frame(frame)
    rolls = []
    rolls << frame.roll_one
    rolls << frame.roll_two if frame.roll_two != nil
    @all_rolls << rolls
    @strikes << frame.strike?
    @spares << frame.spare?
  end

  def calculate_all_frame_totals
    @frame_number = 0
    loop do
      calculate_total_by_frame
      @frame_number += 1
      break if @frame_number == 10
    end
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
      frame_score += @all_rolls[@frame_number][0] + @all_rolls[@frame_number][1]
    end
    @score_by_frame[@frame_number] = frame_score
  end

  def calculate_total
    total = 0
    @score_by_frame.each do |score|     
      total += score
    end
    @total_score = total
  end


end
