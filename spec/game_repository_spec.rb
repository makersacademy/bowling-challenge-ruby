require "Game_repository"
require "frame"

RSpec.describe "GameRepository Integration Tests" do
  it "should calculate the correct scores" do
    game = GameRepository.new()
    player_hits = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
    player_hits.each do |pins|
      game.add(pins)
    end
    expect(game.score_card).to eq 133
  end
end
