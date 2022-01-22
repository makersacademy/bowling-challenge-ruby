# frozen_string_literal: true

require 'frame'

describe Frame do
  subject(:frame) { described_class.new(roll1: 3, roll2: 4) }
  describe '#roll1' do
    it 'returns roll1' do
      expect(frame.roll1).to eq(3)
    end
  end

  describe '#roll2' do
    it 'returns roll2' do
      expect(frame.roll2).to eq(4)
    end
  end
end
