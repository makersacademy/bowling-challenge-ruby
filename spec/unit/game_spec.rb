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

  it 'can roll a strike' do
    subject.roll(10)
    18.times{ subject.roll(1) }
    expect(subject.score).to eq 30
  end

  it 'can roll 2 strikes' do
    subject.roll(10)
    subject.roll(10)
    16.times{ subject.roll(1) }
    expect(subject.score).to eq 49
  end

  it 'can roll a strike in the final frame' do
    18.times{ subject.roll(1) }
    3.times{ subject.roll(10) }
    expect(subject.score).to eq 48
  end

  it 'can roll a spare in the final frame' do
    18.times{ subject.roll(1) }
    subject.roll(4)
    subject.roll(6)
    subject.roll(5)
    expect(subject.score).to eq 33
  end

end