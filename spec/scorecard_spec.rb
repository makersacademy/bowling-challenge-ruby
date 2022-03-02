require_relative '../lib/frame'
require_relative '../lib/scorecard'
require 'spec_helper'

describe Scorecard do
  before do 
    @scorecard = Scorecard.new
  end

  it 'creates a gutter game' do
    20.times do 
        @scorecard.roll(0)
    end
    expect(@scorecard.final_score).to eq 0
  end 
  it 'creates a standard game' do
    20.times do 
        @scorecard.roll(2)
    end
    expect(@scorecard.final_score).to eq 40
  end
  it 'creates a spare' do
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(7)
    @scorecard.roll(1)
    expect(@scorecard.final_score).to eq 25
  end 
  it 'creates a 2 spares' do
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(7)
    @scorecard.roll(1)
    expect(@scorecard.final_score).to eq 51
  end 
end

#   it 'creates a perfect game' do
#     10.times do 
#         @frame.roll(10)
#         @scorecard.score(@frame.frame,@frame.frame_end, @frame.standard_roll, @frame.is_strike)
#        @frame = Frame.new(0,0)
#     end
#     expect(@scorecard.game_total).to eq 300
#   end



