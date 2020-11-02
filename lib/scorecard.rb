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

  def current_total
    @scores.see_current_total
  end

  def game_end_type
    puts "Gutter Game!" if gutter_game?
    puts "Perfect Game!" if perfect_game?
  end

  def perfect_game?
    game_over? && perfect_total?
  end

  def gutter_game?
    game_over? && gutter_total?
  end

  def game_over?
    if @scores.last_frame? && @scores.third_roll?
      return !@scores.first_roll_strike?
    elsif @scores.last_frame? && @scores.fourth_roll?
      return @scores.first_roll_strike?
    end
    false
  end

  private

  def perfect_total?
    @scores.see_current_total == 300
  end

  def gutter_total?
    @scores.see_current_total == 0
  end
end