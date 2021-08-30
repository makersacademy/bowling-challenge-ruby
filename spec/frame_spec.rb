require_relative '../lib/frame'
require_relative '../lib/game'

describe Frame do
  let(:frame) { described_class.new }
  
  describe '#initialize' do
    it 'should initialize with empty frame_score array' do
      expect(frame.frame_score).to eq([])
    end

    it 'should initialize with two rolls remaining' do
      expect(frame.rolls_remaining).to eq(2)
    end
  end
end