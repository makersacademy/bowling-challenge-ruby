require 'bowling'

describe BowlingScore do
  let(:bowling) { BowlingScore.new }
  it 'hits 5 pins' do
    expect(bowling.hit(5)).to eq (5)
  end

  it 'current score to equal 5' do
    bowling.hit(5)
    expect(bowling.current_score).to eq (5)
  end
end