class Game 
  attr_reader :user_input
  
  def user_input_scores(user_input = gets.chomp.to_i)
    raise "Score need to between 0 and 10" if user_input > 10
    puts 'Please enter your scores - need to between 0 and 10: '
   p user_input
  end

end
