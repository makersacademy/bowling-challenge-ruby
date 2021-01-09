require "bowling_game"
RSpec.describe BowlingGame do
  describe "behavior" do
    it "can roll" do
      game = BowlingGame.new
      20.times { game.roll 0 }
      expect(game.score).to eq 0
    end
    it "can roll all ones" do
      game = BowlingGame.new
      20.times { game.roll 1 }
      expect(game.score).to eq 20
    end
  end
end
