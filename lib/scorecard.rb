# frozen_string_literal: true

# Main scorecard class - may need extraction later
class ScoreCard
  def input(user_input)
    user_input
  end

  def user_request
    puts 'Please enter a score:'
    input(gets.to_i)
  end
end
