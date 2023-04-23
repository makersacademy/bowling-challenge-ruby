require 'frame'
require_relative 'spec_helper'

RSpec.describe Frame do
  context "given a full 2 rolls" do
    it "adds the pins to frame points" do
      frame_one = Frame.new
      frame_one.roll_one(5)
      frame_one.roll_two(5)

      expect(frame_one.frame_points).to eq(10)
    end
  end

  context "given roll_one is 10" do
    it "returns strike as true" do
      frame_one = Frame.new
      frame_one.roll_one(10)

      expect(frame_one.strike?).to eq(true)
    end
  end

  context "given roll_one + roll_two = 10" do
    it "returns spare as true" do
      frame_one = Frame.new
      frame_one.roll_one(5)
      frame_one.roll_two(5)

      expect(frame_one.spare?).to eq(true)
    end
  end
end