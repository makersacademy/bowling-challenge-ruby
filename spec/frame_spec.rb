# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:gutter_frame) { Frame.new([0, 0]) }
  let(:normal_frame) { Frame.new([5, 3]) }
  let(:spare_frame) { Frame.new([5, 5]) }
  let(:strike_frame) { Frame.new([10, 0]) }

  describe '#sum' do
    it 'returns the sum of the passed in frame array' do
      expect(gutter_frame.sum).to eq 0
      expect(normal_frame.sum).to eq 8
      expect(strike_frame.sum).to eq 10
    end
  end
end
