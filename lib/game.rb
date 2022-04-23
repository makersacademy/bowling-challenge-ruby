class Game 
  attr_reader :counter_frame, :user_input
  
  def user_input_scores
    puts 'Please enter your scores - need to between 0 and 10:'
    @user_input = gets.chomp
    @user_input = @user_input.to_i
    raise "Score need to between 0 and 10" if @user_input.to_i > 10
    return @user_input
  end

  def controller
    user_input_scores
  end

  def frame_manager
    for i in 1..10 do
      roll_counter = 1
      while roll_counter < 3
        @counter_frame = i
        roll_counter += 1
      end
    end
  end
end
