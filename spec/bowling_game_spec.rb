require "bowling_game"
RSpec.describe BowlingGame do
  describe "game behavior" do
    it "can create a new game" do
      game = BowlingGame.new
    end
    it "can roll" do
      game = BowlingGame.new
      20.times { game.roll 0 }
      expect(game.score).to eq 0
    end
  end
end
