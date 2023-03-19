require 'bowling'

RSpec.describe Bowling do
  context "player knocks down 6 pins in first roll of first frame" do
    it "records 6 points" do
    bowling = Bowling.new
    bowling.roll(6)
    expect(bowling.total_score).to eq 6
    end
  end

  context "player knocks down 1 pin in second roll of first frame" do
    it "records 1 point and adds to 6 points" do
    bowling = Bowling.new
    bowling.roll(6)
    bowling.roll(1)
    expect(bowling.total_score).to eq 7
    end
  end
end