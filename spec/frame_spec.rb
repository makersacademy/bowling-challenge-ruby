# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:roll1) { 3 }
  let(:roll2) { 4 }
  describe '#initialize' do
    it 'creates an instance of Frame' do
      frame = Frame.new(roll1, roll2)
      expect(frame).to be_an_instance_of Frame
    end
    it 'returns the score of the frame' do
      frame = Frame.new(roll1, roll2)
      expect(frame.frame_score).to eq 7
    end
  end
end
