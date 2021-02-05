require 'scorecard'

describe Scorecard do
  it 'returns a score' do
    expect(subject.score([0])).to eq 0
  end

end
