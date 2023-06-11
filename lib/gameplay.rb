require_relative 'scorecard'

class Gameplay
  attr_accessor :current_frame, :current_ball

  def initialize
    @current_frame = 1
    @current_ball = 1
    @scorecard = ScoreCard.new
  end

  def score_prompt(frames)
    puts "Enter score for frame #{current_frame}, ball #{current_ball}:"
    input = gets.chomp
    input = input.upcase if input.is_a? String
    return false if validate_input(input, frames) == false
    input = input.to_i if input != "X" && input != "/"
    frame = frames[@current_frame]
    process_current_ball(frame, input)
    @scorecard.show_scorecard(frames)
    return true
  end
  
  def process_current_ball(frame, input)
    if input == "X"
      frame.strike(@current_ball)
    elsif input == "/"
      frame.spare
    else
      frame.add_ball_score(@current_ball, input)
    # binding.irb
    end
  end

  def next_ball(frames)
    @scorecard.update_pending_bonuses(frames, @current_frame)
    
    if @current_frame < 10
      if @current_ball == 1 && frames[@current_frame].strike? != true
        @current_ball = 2
      else
        @current_frame = @current_frame + 1
        @current_ball = 1
      end
    else
      @current_ball = @current_ball + 1
    end
  end

  def continue?(frames)
    frame = frames[@current_frame]
    # binding.irb
    if @current_frame == 10 && @current_ball == 4
      return false
    elsif @current_frame == 10 && frame.two_balls? == true && frame.spare? == false && frame.strike? == false
      return false
    else
      return true
    end
  end

  def final_score(frames)
    score = 0
    frames.values.each do |frame|
      score = score + frame.total_frame_score
    end
    puts "\nYour final score is: #{score}"
  end
  
  private
  
  def validate_input(input, frames)
    return false if input == ""
    return false if input == "/" && @current_ball == 1
    return false if input == "X" && @current_ball == 2
    return false if /[X\/1-9]/.match(input) == nil
  end
end
