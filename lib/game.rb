require_relative './frame'

class Game

  def initialize
    @game_scores = []
  end

  def self.start
    for game_round in 1..10
      current_frame = Frame.new(game_round)
      current_frame.first_roll(get_score(game_round, current_frame.current_roll))
      strike(current_frame) if gameframe.current_roll == 1 && gameframe.state
      current_frame.second_roll(get_score(game_round, current_frame.current_roll))
    end
  end

  private

  def get_score(round, roll)
    puts "Round #{round} - Roll #{roll} | Type in your score: "
    gets.chomp().to_i
  end

  def strike(gameframe)
    @game_scores << gameframe.total_score
  end
end