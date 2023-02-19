require "bowling_game"
require "frame"

RSpec.describe "BowlingGame Integration Tests" do
  it "should calculate the correct scores" do
    game = BowlingGame.new(Kernel, Frame)
    player_hits = [4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
    game.play(1)
    game.play(4)
    expect { game.print_score }.to output("Your current score: 5.\n").to_stdout
    player_hits.each do |hits|
      game.play(hits)
    end
    game.play(1)
    expect { game.print_score }.to output("Game ended! Your total score: 133.\n").to_stdout
  end
end
