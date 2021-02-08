# frozen_string_literal: true

require_relative 'score'

# Main scorecard class - may need extraction later
class ScoreCard
  def initialize
    @score = Score.new
  end

  def user_request
    puts 'Please enter a score:'
  end

  def input_checker(input)
    exit if input == 'quit'
    begin
      Integer(input)
    rescue StandardError
      puts 'That is an incorrect input'
    end
  end

  def current_total
    p score
    score.total_score
  end

  def run
    loop do
      user_request
      input = $stdin.gets.chomp
      input_checker(input)
      score.add_score(input)
      p score.total_score
    end
  end

  private #-----------------------------
  attr_reader :score
end
