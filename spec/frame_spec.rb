require_relative '../lib/frame'
require_relative '../lib/scorecard'
require 'spec_helper'

describe Frame do
  before do 
    @frame = Frame.new
  end

  it 'can roll pins' do 
    @frame.roll(1)
    expect(@frame.standard?).to eq true
  end 

  it 'completes a frame' do 
    @frame.roll(1)
    @frame.roll(1)
    expect(@frame.complete?).to eq true
  end 

  it 'rolls a strike' do 
    @frame.roll(10)
    expect(@frame.strike?).to eq true
  end 

  it 'rolls a spare' do 
    @frame.roll(1)
    @frame.roll(9)
    expect(@frame.spare?).to eq true
  end 
end