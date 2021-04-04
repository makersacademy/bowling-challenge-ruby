# frozen_string_literal: true

require 'frame'

describe Frame do
  let(:frame) { Frame.new }
  describe '#rolls' do
    it 'should go to the next roll' do
      expect(frame.rolls).to eq []
    end
  end

  describe 'roll' do
    it 'gets user input and saves it' do
      frame.roll(3)
      frame.roll(5)

      expect(frame.rolls).to eq [3, 5]
    end
  end

  describe '#is_strike?' do
    it 'should know when a roll is a strike' do
      frame.roll(10)

      expect(frame.is_strike?).to eq true
    end
    it 'should know when it is not a strike' do
      frame.roll(4)

      expect(frame.is_strike?).to eq false
    end
  end

  describe '#is_spare?' do
    it 'should know a spare wass rolled' do
      frame.roll(4)
      frame.roll(6)

      expect(frame.is_spare?).to eq true
    end
    it 'should know a spare was not rolled' do
      frame.roll(4)
      frame.roll(3)

      expect(frame.is_spare?).to eq false
    end
  end

  describe '#count' do
    it 'can count up the rolls' do
      frame.roll(4)
      frame.roll(3)

      expect(frame.count).to eq 7
    end
    it 'can count up the rolls' do
      frame.roll(5)
      frame.roll(4)

      expect(frame.count).to eq 9
    end
  end
end
