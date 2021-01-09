require 'frame'

describe Frame do
  let(:frame) { Frame.new(1) }

  describe "#add_roll" do
    it "should record the number of knocked down pins for a roll" do
      frame.add_roll(7)
      expect(frame.first_roll_score).to eq 7
    end
  end

  describe "#strike?" do
    it "should be true if frame is strike" do
      frame.add_roll(10)
      expect(frame).to be_a_strike
    end
  end

  describe "#spare?" do
    it "should be true if frame is spare" do
      frame.add_roll(5)
      frame.add_roll(5)
      expect(frame).to be_a_spare
    end
  end

  describe "#total_score" do
    it "should return the sum of score plus prior score" do
      frame.add_roll(5)
      frame.add_roll(5)
      frame.add_bonus(5)
      expect(frame.total_score(5)).to eq 20
    end
  end

  describe "#first_roll_score" do
    it "should return the first roll score" do
      frame.add_roll(5)
      expect(frame.first_roll_score).to eq 5
    end
  end

  describe "#second_roll_score" do
    it "should return nil if there is no roll score" do
      frame.add_roll(5)
      expect(frame.second_roll_score).to be nil
    end

    it "should return the second roll score if there is a roll score" do
      frame.add_roll(5)
      frame.add_roll(5)
      expect(frame.second_roll_score).to eq 5
    end
  end
end
