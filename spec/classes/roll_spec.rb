# frozen_string_literal: true
require_relative '../../lib/roll'
require 'rspec'

describe 'Roll' do
  context 'when Roll is initialised' do
    roll1 = Roll.new
    it 'should add 1 to the roll count' do
      expect(roll1.roll_count).to eq 0
    end
    it 'should return pins_hit as 0' do
      expect(roll1.pins_hit).to eq 0
    end
  end
  context "when roll is being called multiple times" do
    it 'should raise error when roll_count > 1 is passed in' do
    roll = Roll.new
      roll.roll_score(4)
      roll.roll_score(3)
      expect{roll.roll_score(3)}.to raise_error(RuntimeError)
    end
    it 'next roll should return 9 for pins_hit' do
      roll = Roll.new
      nine_pins_hit = roll.roll_score(9)
      roll_count = roll.roll_count
      expect(nine_pins_hit).to eq 9
      expect(roll_count).to eq 1
    end

    it 'roll_score should return 9 for pins_hit' do
      roll = Roll.new
      roll.roll_score(9)
      roll_count = roll.roll_count
      expect(roll.pins_hit).to eq 9
      expect(roll_count).to eq 1
    end
    it 'roll_score should return 10 for pins_hit & "Strike" for hit_type' do
      roll = Roll.new
      roll.roll_score(10)
      expect(roll.hit_type).to eq "Strike"
      expect(roll.pins_hit).to eq 10
    end
    it 'roll_score should return 10 for pins_hit & "Spare" for hit_type' do
      roll = Roll.new
      roll.roll_score(5)
      roll.roll_score(5)
      expect(roll.hit_type).to eq "Spare"
      expect(roll.pins_hit).to eq 10
    end
    it 'roll_score should return 10 for pins_hit & "Spare" for hit_type' do
      roll = Roll.new
      roll.roll_score(10)
      expect(roll.hit_type).to eq "Strike"
      expect(roll.pins_hit).to eq 10
    end
    it "should test every combination of rolls" do
    [10,9,8,7,6,5,5,4,3,2,1,0].map.with_index do |n,index|
      roll = Roll.new
      roll.roll_score(n)
      roll.roll_score(index)
      case
      when @pins_hit == 0
        expect(roll.hit_type).to eq "Gutter"
      when roll.pins_hit < 10
        expect(roll.hit_type).to eq  "Base"
      when (@pins_hit = 10) && (@roll_count == 1)
        expect(roll.hit_type).to eq  "Strike"
      else
        expect(roll.hit_type).to eq  "Spare"
      end

    end
    end

  end
end
