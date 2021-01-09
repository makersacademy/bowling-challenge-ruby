require "bowling_game"
RSpec.describe BowlingGame do
  describe "behavior" do
    before do
      @game = described_class.new
    end
    it "can roll" do
      20.times { @game.roll 0 }
      expect(@game.score).to eq 0
    end
    it "can roll all ones" do
      20.times { @game.roll 1 }
      expect(@game.score).to eq 20
    end
  end
end
