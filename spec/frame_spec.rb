require 'frame'

describe "the possibilities within a frame" do

  it "returns the sum of two rolls" do
    expect(Frame.new.roll(2, 4)).to eq 6
  end

  it "returns the points of a strike" do
    expect(Frame.new.strike).to eq 10
  end

  it "returns the points of a spare" do
    expect(Frame.new.spare).to eq 10
  end
  
end