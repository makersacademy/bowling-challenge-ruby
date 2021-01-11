# frozen_string_literal: true

require 'bowling_game'

describe BowlingGame do
  it 'creates an instance of BowlingGame' do
    expect(subject).to be_instance_of BowlingGame
  end

  it 'adds throws to a frame' do
    new_game = BowlingGame.new
    new_game.throw(4)
    new_game.throw(4)
    expect(new_game.running_score).to eq [[4, 4]]
  end

  it 'has a running total' do
    new_game = BowlingGame.new
    new_game.throw(4)
    new_game.throw(4)
    new_game.throw(10)
    new_game.throw(6)
    new_game.throw(3)
    expect(new_game.overall_score).to eq 27
  end
end
