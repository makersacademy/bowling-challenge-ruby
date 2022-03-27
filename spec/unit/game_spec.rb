require_relative '../../lib/game'

describe Game do
  it 'can create a new game' do
    expect { game = Game.new }.not_to raise_error
  end

  it 'can roll a gutter game' do
    20.times{ subject.roll(0) }
    expect(subject.score).to eq 0
  end

end