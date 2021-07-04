require 'game'

describe Game do
  let(:roll) { instance_double(Roll) }

  it 'can score a gutter game' do
    allow(roll).to receive(:pins=).with(0).and_return(0)
    allow(roll).to receive(:pins).and_return(0)

    20.times { subject.roll(0, roll) }
    expect(subject.score).to eq 0 
  end

  it 'can score a game of all 1s' do
    allow(roll).to receive(:pins=).with(1).and_return(1)
    allow(roll).to receive(:pins).and_return(1)

    20.times { subject.roll(1, roll) }
    expect(subject.score).to eq 20
  end

end
