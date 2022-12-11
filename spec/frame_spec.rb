require 'frame'

RSpec.describe Frame do
  context "is not a strike or a spare" do
    it "returns false when the player does not hit a strike" do
      frame = Frame.new(6,3)
      expect(frame.strike).to eq false
    end
    it "returns false when the player does not hit a spare" do
      frame = Frame.new(6,3)
      expect(frame.spare).to eq false
    end
  end

  context "is a strike or a spare" do
    it "returns true when the player hits a strike" do
      frame = Frame.new(10,0)
      expect(frame.strike).to eq true
    end
    it "returns true when the player hits a spare" do
      frame = Frame.new(6,4)
      expect(frame.spare).to eq true
    end
  end
end