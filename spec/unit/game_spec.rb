require_relative '../../lib/game'

describe Game do
  it 'can create a new game' do
    expect { game = Game.new }.not_to raise_error
  end

  it 'can roll a gutter game' do
    20.times{ subject.roll(0) }
    expect(subject.score).to eq 0
  end

  it 'can roll 20 scores of 1' do
    20.times{ subject.roll(1) }
    expect(subject.score).to eq 20
  end

  it 'can roll a spare' do
    subject.roll(4)
    subject.roll(6)
    18.times{ subject.roll(1) }
    expect(subject.score).to eq 29
  end

end