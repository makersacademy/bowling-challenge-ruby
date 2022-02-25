require 'bowling'

describe Bowling do
  let(:bowling) { Bowling.new}
   
  it 'returns number of knocked down pins' do
    bowling.roll(10)
    expect(bowling.score).to eq 10
  end
  
  it 'returns score of a gutter game' do
    20.times{bowling.roll(0)}
    expect(bowling.score).to eq 0
  end

  it 'returns score of all ones' do
    20.times{bowling.roll(1)}
    expect(bowling.score).to eq 20
  end

  it 'returns score for spares' do
    bowling.roll(5)
    bowling.roll(5)
    bowling.roll(3)
    17.times{bowling.roll(0)}
    expect(bowling.score).to eq 16
  end
end

