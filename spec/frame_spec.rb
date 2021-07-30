require 'frame'

describe Frame do
  let(:subject) {described_class.new(round: 1)}
  it 'is expected to start on round 1' do
    expect(subject.round).to eq(1)
  end

  it 'is expected to have a score' do
    expect(subject.score).to be_instance_of(Score)
  end
end