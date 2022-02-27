require_relative '../lib/frame'
require_relative '../lib/scorecard'
require 'spec_helper'

describe Frame do
  before do
    @frame = Frame.new(0,0)
    @scorecard = Scorecard.new
  end

  it 'creates a gutter game' do
    20.times do 
      while @frame.frame_end == false do 
        @frame.roll(0)
        @scorecard.score(@frame.frame,@frame.frame_end, @frame.standard_roll, @frame.is_strike)
      end
      @frame = Frame.new(0,0)
    end
    expect(@scorecard.game_total).to eq 0
  end
  it 'creates a perfect game' do
    10.times do 
        @frame.roll(10)
        @scorecard.score(@frame.frame,@frame.frame_end, @frame.standard_roll, @frame.is_strike)
       @frame = Frame.new(0,0)
    end
    expect(@scorecard.game_total).to eq 300
  end

end
