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
end