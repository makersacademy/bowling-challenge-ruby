# frozen_string_literal: true

require 'game_one'

describe 'a bowling match' do
  let(:game) { GameOne.new }
  it 'a player rolls 5 strikes in a row' do
    game.roll(GameOne::STRIKE)
    game.roll(GameOne::STRIKE)
    game.roll(GameOne::STRIKE)
    game.roll(GameOne::STRIKE)
    game.roll(GameOne::STRIKE)
    expect(game.total).to eq 120
  end
  it 'a player scores 5 gutter frames in a row' do
    10.times { game.roll(0) }
    expect(game.total).to eq 0
  end
  it "a player scores 5 4's and a 2 and a 10" do
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(2)
    game.roll(GameOne::STRIKE)
    expect(game.total).to eq 32
  end
  it "a player scores 5 4's, a 2, a strike, a 5 and a 2" do
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(4)
    game.roll(2)
    game.roll(GameOne::STRIKE)
    game.roll(5)
    game.roll(2)
    expect(game.roll_counter).to eq 11
    expect(game.total).to eq 46
  end

  it 'a player scores 10,10,3,7,3,7,10,10' do
    game.roll(GameOne::STRIKE)
    game.roll(GameOne::STRIKE)
    game.roll(3)
    game.roll(7)
    game.roll(3)
    game.roll(7)
    game.roll(GameOne::STRIKE)
    game.roll(GameOne::STRIKE)
    expect(game.total).to eq 106
  end
end
