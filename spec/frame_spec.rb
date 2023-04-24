require 'frame'
require_relative 'spec_helper'

RSpec.describe Frame do
  context "given a full 2 rolls" do
    it "adds the pins to frame points" do
      frame_one = Frame.new(5, 3)
      expect(frame_one.frame_points).to eq([5, 3])
    end
  end

  context "given first roll is 10" do
    it "skips the next roll" do
      frame_one = Frame.new(10, 3)
      expect(frame_one.frame_points).to eq([10, 3])
    end
  end

  context "given roll_one is 10" do
    it "returns strike as true" do
      frame_one = Frame.new(10, 3)
      expect(frame_one.strike?).to eq(true)
    end
  end

  context "given roll_one + roll_two != 10" do
    it "returns spare as false" do
      frame_one = Frame.new(10, 3)
      expect(frame_one.spare?).to eq(false)
    end
  end

  context "given roll_one + roll_two = 10" do
    it "returns spare as true" do
      frame_one = Frame.new(7, 3)
      expect(frame_one.spare?).to eq(true)
    end
  end
end