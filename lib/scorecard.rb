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

  private

  def perfect_total?
    @scores.see_current_total == 300
  end

  def gutter_total?
    @scores.see_current_total == 0
  end

  def game_over?
    if @scores.last_frame? && @scores.third_roll?
      !@scores.first_roll_strike?
    elsif @scores.last_frame? && @scores.fourth_roll?
      @scores.first_roll_strike?
    end
  end
end