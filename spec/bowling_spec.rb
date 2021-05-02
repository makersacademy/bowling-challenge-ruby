# frozen_string_literal: true

require 'bowling'

describe 'Bowling Game Rules' do
  before do
    @game = Bowling.new
  end

  it 'can roll a gutter game' do
    20.times { @game.roll 0 }
    expect(@game.score).to eq 0
  end

  it 'can roll all ones' do
    20.times { @game.roll 1 }
    expect(@game.score).to eq 20
  end

  it 'can roll a spare' do
    @game.roll(9)
    @game.roll(1)
    @game.roll(4)
    17.times { @game.roll 0 }
    expect(@game.score).to eq 18
  end
end
