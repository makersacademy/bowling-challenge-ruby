require 'frame'

describe Frame do
  let(:subject) {described_class.new(round: 1)}
  it 'is expected to start on round 1' do
    expect(subject.round).to eq(1)
  end

  it 'is expected to have a score' do
    expect(subject.score).to be_instance_of(Score)
  end

  it 'is expected to handle first roll' do
    subject.first_roll(pins: 5)
    expect(subject.score.first_roll_pins).to eq(5)
  end

  it 'is expected to handle second roll' do
    subject.first_roll(pins: 3)
    subject.second_roll(pins: 5)
   expect(subject.score.second_roll_pins).to eq(5)
  end
end