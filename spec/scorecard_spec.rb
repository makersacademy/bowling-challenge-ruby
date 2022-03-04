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
  it 'creates a 2 spares' do
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(7)
    @scorecard.roll(1)
    @scorecard.roll(3)
    @scorecard.roll(7)
    @scorecard.roll(7)
    @scorecard.roll(1)
    expect(@scorecard.final_score).to eq 76
  end 
  it 'creates a a strike' do
    @scorecard.roll(1)
    @scorecard.roll(1)
    @scorecard.roll(10)
    @scorecard.roll(1)
    @scorecard.roll(1)
    expect(@scorecard.final_score).to eq 16
  end 

  it 'creates a a strike' do
    @scorecard.roll(1)
    @scorecard.roll(1)
    @scorecard.roll(10)
    @scorecard.roll(1)
    @scorecard.roll(1)
    @scorecard.roll(10)
    @scorecard.roll(10)
    @scorecard.roll(2)
    @scorecard.roll(3)
    expect(@scorecard.final_score).to eq 58
  end 

  it 'creates a a perfect game' do
    12.times do 
      @scorecard.roll(10)
  end
    expect(@scorecard.final_score).to eq  300
  end 

  it 'creates a a strike and a spare' do
    @scorecard.roll(1)
    @scorecard.roll(1)
    @scorecard.roll(2)
    @scorecard.roll(8)
    @scorecard.roll(10)
    @scorecard.roll(2)
    @scorecard.roll(3)
    expect(@scorecard.final_score).to eq 42
  end 

  it 'creates a standard game' do
    21.times do 
        @scorecard.roll(2)
    end
    expect(@scorecard.end_of_game).to eq "THE GAME HAS ENDED! START A NEW ONE"
  end 
 
end 