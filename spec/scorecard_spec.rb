require 'scorecard'

describe Scorecard do
  it 'gets the first score' do
    score = 10
    expect(subject.total).to eq score
  end
end
