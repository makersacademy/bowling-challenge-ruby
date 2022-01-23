require 'bowling'

describe Bowling do
  let(:bowling) { Bowling.new}
   
  it 'returns number of knocked down pins' do
    bowling.roll(10)
    expect(bowling.score).to eq 10
  end
  
  it 'plays a gutter game' do
    20.times{bowling.roll(0)}
    expect(bowling.score).to eq 0
  end
end

