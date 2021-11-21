# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:gutter_frame) { Frame.new([0, 0], [3, 3], [3, 3]) }
  let(:normal_frame) { Frame.new([5, 3], [3, 3], [3, 3]) }
  let(:spare_frame) { Frame.new([5, 5], [3, 3], [3, 3]) }
  let(:spare_no_next) { Frame.new([5, 5]) }
  let(:strike_frame) { Frame.new([10, 0], [3, 3], [3, 3]) }
  let(:strike_no_next) { Frame.new([10, 0]) }
  let(:strike_then_strike) { Frame.new([10, 0], [10, 0], [3, 3]) }

  describe '#sum' do
    it 'returns the sum of the passed in frame array' do
      expect(gutter_frame.sum).to eq 0
      expect(normal_frame.sum).to eq 8
      expect(strike_frame.sum).to eq 10
    end
  end

  describe '#bonus_type' do
    it 'returns the type of bonus the frame should receive' do
      expect(gutter_frame.bonus_type).to eq :no_bonus
      expect(normal_frame.bonus_type).to eq :no_bonus
      expect(spare_no_next.bonus_type).to eq :no_bonus
      expect(strike_no_next.bonus_type).to eq :no_bonus
      expect(spare_frame.bonus_type).to eq :spare
      expect(strike_frame.bonus_type).to eq :strike
    end
  end

  describe '#score' do
    it 'returns the score value of the frame' do
      expect(gutter_frame.score).to eq 0
      expect(normal_frame.score).to eq 8
      expect(spare_frame.score).to eq 13
      expect(spare_no_next.score).to eq 10
      expect(strike_frame.score).to eq 16
      expect(strike_no_next.score).to eq 10
      expect(strike_then_strike.score).to eq 23
    end
  end
end
