class Game 
  attr_reader :counter_frame
  
  def user_input_scores(user_input = gets.chomp.to_i)
    raise "Score need to between 0 and 10" if user_input > 10
    puts 'Please enter your scores - need to between 0 and 10: '
    user_input
  end

  def controller
    user_input_scores
  end

  def frame_manager
    for i in 1..10 do
      @counter_frame = i
    end
  end
end
