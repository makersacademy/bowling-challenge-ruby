require "bowling_game"
require "frame"

RSpec.describe "BowlingGame Integration Tests" do
  it "should calculate the correct scores" do
    game = BowlingGame.new(Kernel, Frame)
    player_scores = [4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
    game.play(1)
    game.play(4)
    expect { game.print_score }.to output("Your current score: 5.\n").to_stdout
    player_scores.each do |score|
      game.play(score)
    end
    game.play(1)
    expect(game.calculate_total_score).to eq 133
    expect { game.print_score }.to output("Game ended! Your total score: 133.\n").to_stdout
  end
end
