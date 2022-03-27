# frozen_string_literal: true

require 'frame'

describe Frame do
  subject(:frame_class) { Frame.new(roll_class) }
  let(:roll_class) { double :roll_class, new: roll_double }
  let(:roll_double) { double :roll_double, pins: pins }
  let(:pins) { 5 }

  describe '.roll' do
    it 'starts off empty' do
      expect(frame_class.frame).to be_empty
    end

    it 'stores the first roll' do
      frame_class.roll(pins)
      expect(frame_class.frame).to include roll_double
    end

    it 'stores the second roll' do
      2.times { frame_class.roll(pins) }
      expect(frame_class.frame.length).to be 2
    end

    it 'finishes the frame when there is a strike' do
      frame_class.roll(10)
      expect(frame_class.frame.length).to be 2
    end
  end

  describe 'Edge Cases' do
    it 'raises an error when trying to add another roll' do
      error_message = 'Frame has reached the maximum amount of rolls'
      expect { 3.times { frame_class.roll(pins) } }.to raise_error(IncorrectRollError, error_message)
    end

    it 'raises an error when the amount of pins are more than pins left' do
      error_message = 'Number of pins entered exceeds the amount of pins left'
      frame_class.roll(pins)
      expect { frame_class.roll(8) }.to raise_error(IncorrectRollError, error_message)
    end
  end
end
