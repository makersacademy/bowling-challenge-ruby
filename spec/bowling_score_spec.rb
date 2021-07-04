require 'bowling'

describe BowlingScore do
  it 'hits 5 pins' do
    bowling = BowlingScore.new
    expect(bowling.hit(5)).to eq (5)
  end

  it 'current score to equal 5' do
    bowling = BowlingScore.new
    bowling.hit(5)
    expect(bowling.current_score).to eq (5)
  end
end