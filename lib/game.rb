class Game 
attr_reader :user_input
  def user_input_scores
    puts 'Please enter your scores - need to between 0 and 10: '
    @user_input = gets.chomp
  end
end
