require "frame"

RSpec.describe Frame do
  context "Adds 1 roll" do
    it "score updates when adding a roll of 5" do
      frame = Frame.new
      frame.add_roll(5)
      expect(frame.score).to eq 5
    end
  end

  context "Adds 2 rolls" do
    it "score updates when adding a roll of 5 and then 4" do
      frame = Frame.new
      
      frame.add_roll(5)
      expect(frame.score).to eq 5
      
      frame.add_roll(4)
      expect(frame.score).to eq 9
    end
  end
end
