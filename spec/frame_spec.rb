require_relative '../lib/frame'
require_relative '../lib/game'

describe Frame do
  let(:frame) { described_class.new }

  describe '#initialize' do
    it 'should initialize with empty frame_score array' do
      expect(frame.frame_score).to eq([])
    end

    it 'should initialize with bonus score of 0' do
      expect(frame.bonus_score).to eq(0)
    end

    it 'should initialize with multiplier' do
      expect(frame.multiplier).to eq(0)
    end
  end

  describe '#add_score' do
    it 'should record the score' do
      frame.add_score(6)
      expect(frame.last_score).to eq(6)
    end

    it 'should add bonus if there is a multiplier' do
      multiplier_frame = Frame.new(2)
      multiplier_frame.add_score(3)
      multiplier_frame.add_score(3)
      expect(multiplier_frame.bonus_score).to eq(6)
    end
  end

  describe '#close_frame' do
    it 'should add 0 to frame score after a strike' do
      frame.add_score(10)
      frame.close_frame
      expect(frame.last_score).to eq(0)
    end
  end
end
