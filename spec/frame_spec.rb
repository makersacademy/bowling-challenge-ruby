require 'spec_helper'
require './lib/frame'

describe Frame do
  let(:frame) { Frame.new }

  describe '#first_roll' do
    it 'can knock 9 pins' do
      frame.first_roll(9)
      expect(frame.knocked_pins).to eq 9 
    end
  end

  describe '#second_roll' do
    it 'can knock 1 pin' do
      frame.first_roll(9)
      frame.second_roll(1)
      expect(frame.knocked_pins).to eq 10
    end
  end

  describe '#over' do
    it "can't knock more than 10 pins with the 1st roll" do
      expect { frame.first_roll(11) }.to raise_error('Re-type number, so it is between 0 and 10')
    end
    it "can't knock more than 10 pins with 2nd roll" do
      frame.first_roll(9)
      expect { frame.second_roll(2) }.to raise_error('Re-type number, so it is between 0 and 10')
    end
  end

  describe 'frame score' do
    it 'records frame score' do
      frame.first_roll(3)
      frame.second_roll(4)
      frame.first_roll(6)
      frame.second_roll(2)
      expect(frame.frame).to eq({ first_roll: 6, second_roll: 2 })
    end
    it 'records strikes' do
      frame.first_roll(10)
      expect(frame.frame).to eq({ first_roll: 'strike' })
    end
    it 'records spares' do
      frame.first_roll(1)
      frame.second_roll(9)
      expect(frame.frame).to eq({ first_roll: 1, second_roll: 'spare' })
    end
  end
end
