require 'game'

describe Game do
  let(:frame1) { double :frame1 }
  let(:frame2) { double :frame2 }
  let(:frame3) { double :frame3 }

  before do
    allow(frame1).to receive(:total_score).and_return(0)
    allow(frame2).to receive(:total_score).and_return(0)
    allow(frame3).to receive(:total_score).and_return(0)
  end

  it "Starts with frame number of 0" do
    expect(subject.current_frame_number).to eq(0)
  end

  context "Adding 3 frames" do

    before do
      subject.new_frame(frame1)
      subject.new_frame(frame2)
      subject.new_frame(frame3)
    end

    it "Correctly returns frame number after 0" do
      expect(subject.current_frame_number).to eq(3)
    end

    it "Correctly returns current frame object" do
      expect(subject.current_frame_object).to be(frame3)
    end

    it "Calling .knocked causes the current frame object to receive message to update pins knocked" do
      expect(frame3).to receive(:input_roll_score).with(3)
      subject.knocked(3)
    end

    it "Correctly updates the score when no strikes or spares" do
      allow(frame1).to receive(:strike?).and_return(false)
      allow(frame2).to receive(:strike?).and_return(false)
      allow(frame2).to receive(:spare?).and_return(false)
      allow(frame3).to receive(:strike?).and_return(false)
      allow(frame3).to receive(:pins_knocked)
      expect(frame1).to_not receive(:add_score)
      expect(frame2).to_not receive(:add_score)
      expect(frame3).to receive(:add_score)
      subject.update_score
    end

    it "Correctly updates the score when the previous frame was a spare" do
      allow(frame1).to receive(:strike?).and_return(false)
      allow(frame2).to receive(:strike?).and_return(false)
      allow(frame2).to receive(:spare?).and_return(true)
      allow(frame3).to receive(:strike?).and_return(false)
      allow(frame3).to receive(:pins_knocked)
      allow(frame3).to receive(:points_for_spare)
      expect(frame1).to_not receive(:add_score)
      expect(frame2).to receive(:add_score)
      expect(frame3).to receive(:add_score)
      subject.update_score
    end

    it "Correctly updates the score when the previous frame was a strike" do
      allow(frame1).to receive(:strike?).and_return(false)
      allow(frame2).to receive(:strike?).and_return(true)
      allow(frame2).to receive(:spare?).and_return(false)
      allow(frame3).to receive(:strike?).and_return(false)
      allow(frame3).to receive(:pins_knocked)
      allow(frame3).to receive(:points_for_strike)
      expect(frame1).to_not receive(:add_score)
      expect(frame2).to receive(:add_score)
      expect(frame3).to receive(:add_score)
      subject.update_score
    end

    it "Correctly updates the score when current and previous two frames are strikes" do
      allow(frame1).to receive(:strike?).and_return(true)
      allow(frame2).to receive(:strike?).and_return(true)
      allow(frame2).to receive(:spare?).and_return(false)
      allow(frame3).to receive(:strike?).and_return(true)
      allow(frame3).to receive(:pins_knocked)
      allow(frame3).to receive(:points_for_strike)
      expect(frame1).to receive(:add_score)
      expect(frame2).to receive(:add_score)
      expect(frame3).to receive(:add_score)
      subject.update_score
    end
  end

end
