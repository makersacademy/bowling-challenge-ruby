# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.new(1) }
  let(:frame_ten) { Frame.new(10) }
  describe '.calculate_score' do
    it 'returns the score of a frame' do
      frame.roll_one = 3
      frame.roll_two = 6
      expect(frame.calculate_score).to eq 9
    end
    it 'returns 3 if frame unfinished' do
      frame.roll_one = 3
      expect(frame.calculate_score).to eq 3
    end
    it 'returns 10 if strike' do
      frame.roll_one = 10
      expect(frame.calculate_score).to eq 10
    end
  end

  describe '.strike?' do
    it 'returns true if roll_one is 10' do
      frame.roll_one = 10
      expect(frame).to be_strike
    end
    it 'returns false if roll_one is less than 10' do
      frame.roll_one = 9
      expect(frame).not_to be_strike
    end
  end

  describe '.spare?' do
    it 'returns true if sum of rolls is 10' do
      frame.roll_one = 5
      frame.roll_two = 5
      expect(frame).to be_spare
    end
    it 'returns false if sum of rolls is less than 10' do
      frame.roll_one = 3
      frame.roll_two = 6
      expect(frame).not_to be_spare
    end
    it 'returns false if strike' do
      frame.roll_one = 10
      expect(frame).not_to be_spare
    end
  end

  describe '.spare_or_strike?' do
    it 'returns true if spare' do
      frame.roll_one = 3
      frame.roll_two = 7
      expect(frame).to be_spare_or_strike
    end
    it 'returns true if strike' do
      frame.roll_one = 10
      expect(frame).to be_spare_or_strike
    end
    it 'returns false if neither spare or strike' do
      frame.roll_one = 3
      frame.roll_two = 4
      expect(frame).not_to be_spare_or_strike
    end
  end

  describe '.finished?' do
    it 'returns true if strike' do
      frame.roll_one = 10
      expect(frame).to be_finished
    end
    it 'returns true if two rolls' do
      frame.roll_one = 9
      frame.roll_two = 0
      expect(frame).to be_finished
    end
    it 'returns false if one roll, not strike' do
      frame.roll_one = 9
      expect(frame).not_to be_finished
    end
    it 'expects 10th frame to be finished if not spare or strike' do
      frame_ten.roll_one = 9
      frame_ten.roll_two = 0
      expect(frame_ten).to be_finished
    end
    it 'expects 10th frame not to be finished if spare' do
      frame_ten.roll_one = 9
      frame_ten.roll_two = 1
      expect(frame_ten).not_to be_finished
    end
  end

  describe '.tenth_frame?' do
    it 'returns true if tenth frame' do
      expect(frame_ten).to be_tenth_frame
    end
    it 'expects 10th frame to be finished if strike, then no strike' do
      frame_ten.roll_one = 10
      frame_ten.roll_two = 9
      expect(frame_ten.calculate_score).to eq 19
    end
    it 'expects 10th frame score to be 30 if three strikes' do
      frame_ten.roll_one = 10
      frame_ten.roll_two = 10
      frame_ten.bonus_roll = 10
      expect(frame_ten.calculate_score).to eq 30
    end
  end
end
