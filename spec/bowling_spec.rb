require 'bowling'

describe Bowling do
  it { is_expected.to respond_to(:roll).with(1).argument }

  before do
    subject { described_class.new }
  end

  it 'can play a gutter game ' do
    20.times { subject.roll(0) }
    expect(subject.score).to eq(0)
  end

  it 'can calculate the score ' do
    20.times { subject.roll(1) }
    expect(subject.score).to eq(20)
  end

  it 'can play a strike' do
    subject.roll(10)
    subject.roll(2)
    subject.roll(3)
    16.times { subject.roll(0) }
    expect(subject.score).to eq 20
  end

  it 'can play a spare' do
    subject.roll(5)
    subject.roll(5)
    subject.roll(5)
    17.times { subject.roll(0) }
    expect(subject.score).to eq 20
  end

  it 'can play a perfect game' do
    12.times { subject.roll(10) }
    expect(subject.score).to eq 300
  end
end
