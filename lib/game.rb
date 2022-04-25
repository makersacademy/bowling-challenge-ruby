class Game 
  attr_reader :counter_frame, :user_input, :total_score_array, :frame_score
  
  def user_input_scores
    puts "Please enter your scores for frame no.#{ @counter_frame } (need to between 0 and 10)"
    @user_input = gets.chomp
    raise "Score need to between 0 and 10" if @user_input.to_i > 10
    return @user_input.to_i
  end
  
  def frame_manager
    @total_score_array = []
    for i in 1..9 do
      @counter_frame = i
      roll_manager
    end
    tenth_frame
  end

  def tenth_frame
    @counter_frame = 10
    user_input_third_roll = 0
    user_input_first_roll = user_input_scores
    if user_input_first_roll == 10
      user_input_third_roll = user_input_scores
    else  
      user_input_second_roll = user_input_scores
      if user_input_second_roll + user_input_first_roll == 10
        user_input_third_roll = user_input_scores
      end
    end
    @frame_score = { one: user_input_first_roll, two: user_input_second_roll, strike: false }
    @total_score_array << @frame_score
    @frame_score = { one: user_input_third_roll, two: 0, strike: false }
    @total_score_array << @frame_score
  end

  def roll_manager
    strike_confirmation = false
    @roll_one = user_input_scores
    strike? ? @roll_two = 0 : @roll_two = user_input_scores
    strike_confirmation = true if @roll_two == 0 && @roll_one == 10
    @frame_score = { one: @roll_one, two: @roll_two, strike: strike_confirmation }
    @total_score_array << @frame_score
  end
  
  def strike?
    @roll_one == 10 ? true : false
  end

  

end
