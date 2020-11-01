require_relative 'scoretracker'

class ScoreCard

  attr_reader :scores

  def initialize(scoretracker = ScoreTracker)
    @scores = scoretracker.new
  end

  def request_roll
    puts "Input your roll:"
    @scores.add_roll(gets.chomp)
  end


end