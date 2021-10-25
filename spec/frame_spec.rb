require "frame"

describe Frame do
  describe ".frame_type" do
    it "is and open frame" do
      frame = Frame.new
      frame.first_roll = 1
      frame.second_roll = 3
      expect(frame.open?).to be true
    end
  end
  describe "#strike?" do
    it "is a strike" do
      frame = Frame.new
      frame.first_roll = 10
      expect(frame.strike?).to be true
    end
    describe "#base_score?" do
      it "calculates a base score" do
        frame = Frame.new
        frame.first_roll = 1
        frame.second_roll = 9
        expect(frame.base_score).to eq 10
      end
    end

    describe "#apply_score" do
      it "applies a score" do
        frame = Frame.new
        frame.first_roll = 1
        frame.second_roll = 5
        expect(frame.apply_score).to eq 6
      end
    end

    describe "#second_roll" do
      it "allows a second roll" do
        frame = Frame.new
        frame.first_roll = 5
        expect(frame.second_roll?).to be true
      end

      it "doesn't allow a second roll" do
        frame = Frame.new
        frame.first_roll = 10
        expect(frame.second_roll?).to be false
      end
    end

    describe "#third_roll" do
      it "allows a third roll" do
        frame = Frame.new(true)
        frame.first_roll = 10
        frame.second_roll = 10
        expect(frame.third_roll?).to be true
      end

      it "doesn't allow a third roll" do
        frame = Frame.new(true)
        frame.first_roll = 1
        frame.second_roll = 8
        expect(frame.third_roll?).to be false
      end
    end

    describe "#last?" do
      it "isn't a last frame" do
        frame = Frame.new
        expect(frame.last?).to be false
      end

      it "is a last frame" do
        frame = Frame.new(true)
        expect(frame.last?).to be true
      end
    end
  end
end
