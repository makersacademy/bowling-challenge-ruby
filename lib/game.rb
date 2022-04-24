class Game 
  attr_reader :counter_frame, :user_input, :total_score_array, :frame_score
  
  def user_input_scores
    puts "Please enter your scores for frame no.#{ @counter_frame } (need to between 0 and 10)"
    @user_input = gets.chomp
    raise "Score need to between 0 and 10" if @user_input.to_i > 10
    return @user_input.to_i
  end

  def controller
    frame_manager
    display_scorecard
  end

  def frame_manager
    @total_score_array = []
    for i in 1..10 do
      @counter_frame = i
      roll_manager
    end
  end

  def roll_manager
    @roll_one = user_input_scores
    strike? ? @roll_two = 0 : @roll_two = user_input_scores
    @frame_score = { one: @roll_one, two: @roll_two }
    @total_score_array << @frame_score
  end
  
  def strike?
    @roll_one == 10 ? true : false
  end

  

end
