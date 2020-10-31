describe Frame do
  let(:frame) { Frame.new(number: 1) }
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

  describe ".spare?" do
    it "Knows if it was a spare" do
      frame.roll(7)
      frame.roll(3)
      expect(frame).to be_spare
    end

    it "Knows if it wasn't a strike" do
      frame.roll(3)
      frame.roll(4)
      expect(frame).not_to be_spare
    end

    it "Knows a strike isn't a spare" do
      frame.roll(10)
      expect(frame).not_to be_spare
    end
  end

  describe ".next_roll_1" do
    context "On standard frame" do
      it "gets the first roll from the next frame" do
        standard_frame = Frame.new(rolls: [7, 2], number: 7)
        next_frame_1 = Frame.new(rolls: [6, 2], number: 8)
        expect(standard_frame.next_roll_1(next_frame_1)).to eq 6
      end
    end

    context "On 10th frame" do
      it "gets the first bonus roll" do
        last_frame = Frame.new(rolls: [7, 3], number: 10)
        last_frame.roll(9)
        expect(last_frame.next_roll_1).to eq 9
      end
    end
  end
end
