require 'game'

describe Game do
  # let(:roll) { instance_double(Roll) }

  it 'can score a gutter game' do
    20.times { subject.roll(0) }
    expect(subject.score).to eq 0 
  end

  it 'can score a game of all 1s' do
    20.times { subject.roll(1) }
    expect(subject.score).to eq 20
  end

  
end
