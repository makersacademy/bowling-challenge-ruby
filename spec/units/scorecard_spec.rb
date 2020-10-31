describe Scorecard do
  let(:scorecard) { Scorecard.new }
  let(:f1) { double(:frame) }
  let(:f2) { double(:frame) }
  let(:f3) { double(:frame) }
  describe ".add" do
    it "adds a frame to the scorecard and assigns it a number" do
      expect(f1).to receive(:number=).with(1)
      scorecard.add(f1)
      frame = scorecard.frames[0]
      expect(frame).to eq f1
    end
  end
  describe ".score" do
    it "calls score on each frame with the next two frames as arguments" do
      allow(f1).to receive(:number=)
      allow(f2).to receive(:number=)
      allow(f3).to receive(:number=)
      expect(f1).to receive(:score).with(f2, f3) { 8 }
      expect(f2).to receive(:score).with(f3, nil) { 8 }
      expect(f3).to receive(:score).with(nil, nil) { 8 }
      scorecard.add(f1)
      scorecard.add(f2)
      scorecard.add(f3)
      scorecard.score
    end
  end
end
