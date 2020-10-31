describe Frame do
  let(:frame) { Frame.new }
  describe ".pins" do
    it "Can store two rolls are return their total" do
      frame.roll(3)
      frame.roll(4)
      expect(frame.pins).to eq 7
    end
  end

  describe ".strike?" do
    it "Knows if it was a strike" do
      frame.roll(10)
      expect(frame).to be_strike
    end

    it "Knows if it wasn't a strike" do
      frame.roll(3)
      frame.roll(4)
      expect(frame).not_to be_strike
    end
  end
end
