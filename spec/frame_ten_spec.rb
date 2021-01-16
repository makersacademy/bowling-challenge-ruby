# frozen_string_literal: true

require 'frame_ten'

describe FrameTen do
  let(:roll1) { 7 }
  let(:roll2) { 4 }
  let(:roll3) { 2 }
  describe '#initilaize' do
    it 'creates an instance of FrameTen' do
      frame_ten = FrameTen.new(roll1, roll2, roll3)
      expect(frame_ten).to be_an_instance_of FrameTen
    end
  end
end
