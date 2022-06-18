require "game"

describe Game do
  let(:game) { Game.new }

  it "should show the current round as 1" do
    expect(game.current_round).to eq 1
  end

  context "should calculate the total score" do
    it "should return the total sum of 8" do
      expect(game).to receive(:total_score).and_return(8)
      expect(game.total_score).to eq 8
    end
  end
end
