# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  before do
    @game = Game.new
  end
  it('can create a new game') do
    Game.new
  end

  it('can roll a gutter game') do
    20.times { @game.roll(0) }
    expect(@game.score).to eq 0
  end

  it('can roll all ones') do
    20.times { @game.roll(1) }
    expect(@game.score).to eq 20
  end

  it('can roll a spare') do
    @game.roll(5)
    @game.roll(5)
    @game.roll(6)
    expect(@game.score).to eq 22
  end

  it('can roll a strike') do
    @game.roll(10)
    @game.roll(2)
    @game.roll(3)
    expect(@game.score).to eq 20
  end

  it('can roll 2 strikes') do
    @game.roll(10)
    @game.roll(2)
    @game.roll(3)
    @game.roll(10)
    @game.roll(4)
    @game.roll(3)
    expect(@game.score).to eq 44
  end

  it('can roll multi strikes') do
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)
    @game.roll(4)
    @game.roll(3)
    expect(@game.score).to eq 108
  end

  it('can roll a perfect game') do
    12.times { @game.roll(10) }
    expect(@game.score).to eq 300
  end
end
