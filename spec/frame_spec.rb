require 'frame'

RSpec.describe Frame do
  context "frame contents" do
    it "scores a frame" do
      frame = Frame.new([4, 5])
      expect(frame.score).to eq(9)
    end
  end
end