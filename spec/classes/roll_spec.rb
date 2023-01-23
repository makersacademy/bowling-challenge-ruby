# frozen_string_literal: true
require_relative '../../lib/roll'
require 'rspec'

describe 'Roll' do
  context 'when Roll is initialised' do
    roll1 = Roll.new
    it 'should return pins_hit as 0' do
      expect(roll1.pins_hit).to eq 0
    end
  end
  context "when roll is being called multiple times" do

    it 'next roll should return 9 for pins_hit' do
      roll = Roll.new
      roll.roll_score(9,1)
      expect(roll.pins_hit).to eq 9
    end

    it 'roll_score should return 9 for pins_hit' do
      roll = Roll.new
      roll.roll_score(9,1)
      expect(roll.pins_hit).to eq 9
    end
    it 'roll_score should return 10 for pins_hit & "Strike" for hit_type' do
      roll = Roll.new
      roll.roll_score(10,1)
      expect(roll.hit_type).to eq "Strike"
      expect(roll.pins_hit).to eq 10
    end
    it 'roll_score should return 10 for pins_hit & "Spare"d for hit_type' do
      roll = Roll.new
      roll.roll_score(5,1)
      roll.roll_score(5,2)
      expect(roll.hit_type).to eq "Spare"
      expect(roll.pins_hit).to eq 10
    end
    it 'roll_score should return 10 for pins_hit & "Strike" for hit_type' do
      roll = Roll.new
      roll.roll_score(10,1)
      expect(roll.hit_type).to eq "Strike"
      expect(roll.pins_hit).to eq 10
    end

    [10,9,8,7,6,5,4,3,2,1,0].map.with_index do |n,index|
      puts index
      it "(Testing Roll 1 (#{n} pins hit) and Testing Roll 2 (#{index});" do
        roll = Roll.new
        roll.roll_score(n,1)
        roll.roll_score(index,2)
      end


    end
  end
  context "should test every combination of rolls for spares and strikes" do
      [10,9,8,7,6,5,4,3,2,1,0].map.with_index do |n,index|
        it "should return Strike for relavent hit types" do
          roll = Roll.new
          roll.roll_score(n,1)
          expect(roll.pins_hit).to eq n

        end
        it "should return Strike for relavent hit types", if: n == 10 do
          roll_strike = Roll.new
          roll_strike.roll_score(n,1)
          expect(roll_strike.pins_hit).to eq n
           expect(roll_strike.hit_type).to eq "Strike"

        end
        it "should return Spare for relavent hit types", if: (n + index )== 10 do
          roll_strike = Roll.new
          roll_strike.roll_score(n,1)
          roll_strike.roll_score(index,2)
          expect(roll_strike.pins_hit).to eq n + index
          expect(roll_strike.hit_type).to eq "Spare"

        end
    #     it "should test every combination of rolls for strikes" do
    #
    #     roll.roll_score(index,2)
    #     expect(roll.pins_hit).to eq(n + index)
    #     # (expect(roll.hit_type).to eq "Strike") if n+index == 10
    # end

    end
  end

  end

