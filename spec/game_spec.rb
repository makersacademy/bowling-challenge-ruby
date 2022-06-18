require "game"

describe Game do
  let(:game) { Game.new }

  it "should show the current round as 1" do
    expect(game.get_round).to eq 1
  end

  context "should return the sum of given numbers" do
    xit "should return the total sum" do
    end
  end
end
