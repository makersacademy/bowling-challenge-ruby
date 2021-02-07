# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.new(1) }
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
    it 'returns false if two rolls' do
      frame.roll_one = 9
      expect(frame).not_to be_finished
    end
  end

end
