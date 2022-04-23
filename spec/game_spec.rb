require_relative '../lib/game'

describe Game do
  it "has a set of rolls as an argument when created" do
    expect(Game).to receive(:new).with Array
    Game.new([[10],[3,4],[5,3],[7,3],[9,1],[10],[9,1],[10],[9,1],[3,5]])
  end
end
