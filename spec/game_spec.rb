require 'game'

describe "components of the game" do

  it "returns the final score of the game" do
    expect(Game.new.strike).to eq 10
  end

  # it "returns the points of a strike" do
  #   expect(Frame.new.strike).to eq 10
  # end

  # it "returns the points of a spare" do
  #   expect(Frame.new.spare).to eq 10
  # end
  
end