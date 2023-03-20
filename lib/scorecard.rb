class Scorecard
  attr_reader :frame_number, :score_so_far
  ROLLING_FIRST_BALL = 1 
  ROLLING_SECOND_BALL = 2

  def initialize
    @frame_number = 1
    @score_so_far = 0
    @frame_scores = []
    @state = ROLLING_FIRST_BALL
    @game_over = false
    
  end

  def game_over?
    @game_over
  end

  def roll(ball)
    
    if @state == @rolling_first_ball
      @first_ball_in_frame = ball
      @state = @rolling_second_ball
    elsif @state == :rolling_second_ball
      @score_so_far += @first_ball_in_frame + ball
      @frame_number += 1
      @frame_scores << @score_so_far
      @state = :rolling_first_ball
    else
      puts "Invalid state: #{@state}"
      exit(1)
    end
    [@score_so_far]
  end




 # My old code
  # attr_reader :total_score

  # def initialize 
  #   @total_score = 0
  # end
  # def add_score(score)
  #   @total_score += score
  # end
  
end