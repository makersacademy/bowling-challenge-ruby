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

  describe ".next_roll_2" do
    context "On standard frame, next frame isn't a strike" do
      it "gets second roll from next frame" do
        standard_frame = Frame.new(rolls: [10], number: 4)
        next_frame_1 = Frame.new(rolls: [4, 5], number: 5)
        next_frame_2 = Frame.new(rolls: [3, 2], number: 6)
        expect(standard_frame.next_roll_2(next_frame_1, next_frame_2)).to eq 5
      end
    end

    context "On standard frame, next frame is a strike" do
      it "gets the first roll from the frame after next" do
        standard_frame = Frame.new(rolls: [10], number: 4)
        next_frame_1 = Frame.new(rolls: [10], number: 5)
        next_frame_2 = Frame.new(rolls: [3, 2], number: 6)
        expect(standard_frame.next_roll_2(next_frame_1, next_frame_2)).to eq 3
      end
    end

    context "On 9th frame, when 10th frame is a strike" do
      it "gets first bonus roll from 10th frame" do
        ninth_frame = Frame.new(rolls: [10], number: 9)
        tenth_frame = Frame.new(rolls: [10], bonus_rolls: [4, 6], number: 10)
        expect(ninth_frame.next_roll_2(tenth_frame)).to eq 4
      end
    end

    context "On 10th frame" do
      it "gets the second bonus roll" do
        last_frame = Frame.new(rolls: [10], number: 10)
        last_frame.roll(3)
        last_frame.roll(6)
        expect(last_frame.next_roll_2).to eq 6
      end
    end
  end

  describe ".bonus" do
    let(:next_frame_1) { double(:frame) }
    let(:next_frame_2) { double(:frame) }
    before :each do
      allow(frame).to receive(:next_roll_1) { 3 }
      allow(frame).to receive(:next_roll_2) { 4 }
    end
    context "strike" do
      it "sums next two rolls" do
        frame.roll(10)
        expect(frame.bonus(next_frame_1, next_frame_2)).to eq 7
      end
    end
    context "spare" do
      it "returns value of next roll" do
        frame.roll(8)
        frame.roll(2)
        expect(frame.bonus(next_frame_1, next_frame_2)).to eq 3
      end
    end
    context "other" do
      it "returns 0" do
        frame.roll(3)
        frame.roll(2)
        expect(frame.bonus(next_frame_1, next_frame_2)).to eq 0
      end
    end
  end
end
