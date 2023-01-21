# frozen_string_literal: true
require_relative '../../lib/roll'
require 'rspec'

describe 'Roll' do
  context 'when Roll is initialised' do
    roll_count = 0
    pins_hit = 5
    roll1 = Roll.new(roll_count,pins_hit)
    it 'should add 1 to the roll count' do
      expect(roll1.roll_count).to eq 1
    end
    it 'should return pins_hit as 5' do
      expect(roll1.pins_hit).to eq 5
    end

    it 'should raise error when roll_count > 1 is passed in' do
      expect{Roll.new(2,pins_hit)}.to raise_error('You can only roll twice a frame')
    end
  end
end
