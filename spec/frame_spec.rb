require 'frame'

RSpec.describe Frame do
  context "frame contents" do
    it "scores a frame" do
      frame = Frame.new([4, 5])
      expect(frame.score).to eq(9)
      expect(frame.spare_or_strike).to eq(false) 
      expect(frame.strike).to eq(false)
      expect(frame.nrolls).to eq(2)
    end

    it "with spare" do
      frame = Frame.new([4, 6])
      expect(frame.spare_or_strike).to eq(true) 
      expect(frame.strike).to eq(false)
    end

    it "with strike" do
      frame = Frame.new([10])
      expect(frame.score).to eq(10)
      expect(frame.spare_or_strike).to eq(true) 
      expect(frame.strike).to eq(true)
      expect(frame.nrolls).to eq(1)
    end

    it "no bonus" do
      frame = Frame.new([0, 4])
      expect(frame.score).to eq(4)
      expect(frame.spare_or_strike).to eq(false) 
      expect(frame.strike).to eq(false)
    end
  end

  context "invalid frame" do
    it "fail" do
      expect { Frame.new([0, 10]) }.to raise_error "invalid frame"
    end

    it "fail" do
      expect { Frame.new([5]) }.to raise_error "invalid frame"
    end
  end
end