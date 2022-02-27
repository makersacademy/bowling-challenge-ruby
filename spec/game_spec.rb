require_relative '../lib/game.rb'

describe Game do
  subject(:game) { described_class.new }
  it 'plays 10 gutter balls' do
    20.times{ game.roll(0) }
    expect(game.score).to eq 0
  end

  it 'keeps track of a score with no bonuses' do
    20.times{ game.roll(2) }
    expect(game.score).to eq 40
  end

  it 'adds a bonus for a spare' do
    game.roll(5); game.roll(5)
    game.roll(3); game.roll(0)
    16.times {game.roll(0)}
    expect(game.score).to eq (5 + 5 + 3) + 3
  end

  it 'adds a bonus 2 consecutive spares' do
    game.roll(5); game.roll(5);
    game.roll(3); game.roll(7);
    game.roll(3); game.roll(0);
    14.times { game.roll(0) }
    expect(game.score).to eq (5 + 5 + 3) + (3 + 7 + 3) + 3
  end

  it 'adds a bonus for a strike' do
    game.roll(10);
    game.roll(3); game.roll(5);
    16.times { game.roll(0) }
    expect(game.score).to eq (10 + 0 + 3 + 5) + 3 + 5
  end

  it 'checks 3 strikes in a row' do
    game.roll(10);
    game.roll(10);
    game.roll(10);
    14.times{ game.roll(0) }
    expect(game.score).to eq (10 + 0 + 10) + (10 + 0 + 10) + (10 + 0 + 10)
  end

  it 'totals a spare on the final frame' do
    18.times{ game.roll(0) }
    game.roll(5); game.roll(5);
    game.roll(3)
    expect(game.score).to eq (5 + 5 + 3) + 3
  end

  it 'scores a perfect game' do
    12.times{ game.roll(10) }
    expect(game.score).to eq 300
  end

end

