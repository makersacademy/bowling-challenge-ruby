require_relative '../lib/frame.rb'

RSpec.describe Frame do
  context "total" do
    it "returns the sum of both rolls" do
      frame = Frame.new
      frame.roll_1 = 3
      frame.roll_2 = 7
      expect(frame.total).to eq 10
    end
  end

  context "spare" do
    it "returns true if the sum of both rolls in a frame equals 10" do
      frame = Frame.new
      frame.roll_1 = 3
      frame.roll_2 = 7
      expect(frame.spare?).to eq true
    end

    it "returns false if the first roll is a 10" do
      frame = Frame.new
      frame.roll_1 = 10
      frame.roll_2 = 0
      expect(frame.spare?).to eq false
    end

    it "returns true if the sum of both rolls in a frame equals 10" do
      frame = Frame.new
      frame.roll_1 = 0
      frame.roll_2 = 10
      expect(frame.spare?).to eq true
    end

    it "returns false if the sum of both rolls is less than 10" do
      frame = Frame.new
      frame.roll_1 = 2
      frame.roll_2 = 3
      expect(frame.spare?).to eq false
    end
  end

  context "strike" do
    it "returns true if the first roll is a 10, returns false otherwise" do
      frame1 = Frame.new
      frame1.roll_1 = 10
      frame1.roll_2 = 0

      frame2 = Frame.new
      frame2.roll_1 = 2
      frame2.roll_2 = 3

      frame3 = Frame.new
      frame3.roll_1 = 0
      frame3.roll_2 = 10

      expect(frame1.strike?).to eq true
      expect(frame2.strike?).to eq false
      expect(frame3.strike?).to eq false
    end
  end
end