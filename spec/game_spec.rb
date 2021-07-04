require 'game'

describe Game do
  let(:roll_double) { double(:roll) }
  let(:roll_double_1) { double(:roll) }
  let(:roll_double_2) { double(:roll) }
  let(:roll_double_3) { double(:roll) }
  let(:roll_class_double) { double(:roll_class) }
  let(:frame_double) { double(:frame) }
  subject { described_class.new(roll_class_double, frame_double) }

  it 'can score a gutter game' do
    allow(roll_class_double).to receive(:new).with(0).and_return(roll_double)
    allow(roll_double).to receive(:pins).and_return(0)
    allow(frame_double).to receive(:ended?).and_return(false, false, true)
    allow(frame_double).to receive(:add)
    allow(frame_double).to receive(:score).and_return(0)
    20.times { subject.roll(0) }
    expect(subject.score).to eq 0 
  end

  it 'can score a game of all 1s' do
    allow(roll_class_double).to receive(:new).with(1).and_return(roll_double)
    allow(roll_double).to receive(:pins).and_return(1)
    allow(frame_double).to receive(:ended?).and_return(false, false, true)
    allow(frame_double).to receive(:add)
    allow(frame_double).to receive(:score).and_return(2)
    20.times { subject.roll(1) }
    expect(subject.score).to eq 20
  end

  xit 'can score one spare' do
    allow(roll_class_double).to receive(:new).with(6).and_return(roll_double_1)
    allow(roll_class_double).to receive(:new).with(4).and_return(roll_double_2)
    allow(roll_class_double).to receive(:new).with(3).and_return(roll_double_3)
    allow(roll_class_double).to receive(:new).with(0).and_return(roll_double)
    allow(roll_double_1).to receive(:pins).and_return(6)
    allow(roll_double_2).to receive(:pins).and_return(4)
    allow(roll_double_3).to receive(:pins).and_return(3)
    allow(roll_double).to receive(:pins).and_return(0)

    subject.roll(6)
    subject.roll(4)
    subject.roll(3)
    17.times { subject.roll(0) }
    expect(subject.score).to eq 16
  end
end
