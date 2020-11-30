require_relative './frame'

class Game

  def initialize
    @game_scores = []
  end

  def self.start
    for game_round in 1..10
      current_frame = Frame.new(game_round)
      current_frame.first_roll(get_score(game_round, 1))
      @game_scores << Frame.total_score if
      current_frame.second_roll(get_score(game_round, 2))
    end
  end

  private

  def get_score(round, roll)
    puts "Round #{round} - Roll #{roll} | Type in your score: "
    gets.chomp().to_i
  end
end