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
      game.enter_score(1)
      game.enter_score(3)
      game.enter_score(4)
      game.enter_score(6)
      expect(game.total_score).to eq 14
    end
  end

  context "frame management" do
    it "should increase the frame by 1" do
      game.enter_score(10)
      expect(game.current_round).to eq 2
    end

    it "should return the total score when current round is greater than 10" do
      10.times { game.enter_score(10) }
      expect(game.current_round).to eq 10
      expect(game.total_score).to eq 100
    end
  end

  context "score management" do
    it "should return true if last roll was a strike" do
      game.enter_score(10)
      expect(game.is_strike).to eq true
    end

    it "should return false if last roll was not a strike" do
      game.enter_score(8)
      expect(game.is_strike).to eq false
    end
  end
end
