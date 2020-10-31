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
  describe ".roll" do
    let(:f1) { double(:frame, :number= => nil) }
    let(:f2) { double(:frame, :number= => nil) }
    let(:frame_class) { double(:frame_class, :new => f1) }
    context "First roll" do
      it "creates a frame, calls roll on it and adds it to the scorecard" do
        expect(frame_class).to receive(:new)
        expect(f1).to receive(:number=).with(1)
        expect(f1).to receive(:roll).with(8)
        scorecard.roll(8, frame_class)
      end
    end
    context "Current frame incomplete" do
      it "calls roll on that frame" do
        allow(f1).to receive(:complete?) { false }
        expect(f1).to receive(:roll).with(2)
        scorecard.add(f1)
        scorecard.roll(2)
      end
    end
    context "Current frame is complete do" do
      it "creates a new frame, calls roll on it and adds it to the scorecard" do
        scorecard.add(f1)
        allow(f1).to receive(:complete?) { true }
        allow(frame_class).to receive(:new) { f2 }
        expect(frame_class).to receive(:new)
        expect(f2).to receive(:number=).with(2)
        expect(f2).to receive(:roll).with(8)
        scorecard.roll(8, frame_class)
      end
    end
  end
end
