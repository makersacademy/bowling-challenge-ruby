require 'game'

describe Game do
  let(:roll_double) { instance_double(Roll) }
  let(:roll_class_double) { double(:roll_class) }
  subject { described_class.new(roll_class_double) }

  it 'can score a gutter game' do
    allow(roll_class_double).to receive(:new).and_return(roll_double)
    allow(roll_double).to receive(:pins=).with(0).and_return(0)
    allow(roll_double).to receive(:pins).and_return(0)

    20.times { subject.roll(0) }
    expect(subject.score).to eq 0 
  end

  it 'can score a game of all 1s' do
    allow(roll_class_double).to receive(:new).and_return(roll_double)
    allow(roll_double).to receive(:pins=).with(1).and_return(1)
    allow(roll_double).to receive(:pins).and_return(1)

    20.times { subject.roll(1) }
    expect(subject.score).to eq 20
  end

end
