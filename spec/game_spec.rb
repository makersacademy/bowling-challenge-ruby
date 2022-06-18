require "game"

describe Game do
  let(:game) { Game.new }

  context "initially" do
    it "should show the current round as 1" do
      expect(game.current_round).to eq 1
    end

    it "should initialise with a total score of 0" do
      expect(game.total_score).to eq 0
    end
  end

  context "should calculate the total score" do
    it "should return the total sum of 14" do
      game.increase_score(1)
      game.increase_score(3)
      game.increase_score(4)
      game.increase_score(6)
      expect(game.total_score).to eq 14
    end
  end

  context "frame management" do
    it "should increase the frame by 1" do
      game.increase_score(10)
      expect(game.current_round).to eq 2
    end
  end
end
