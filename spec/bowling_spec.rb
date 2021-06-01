require 'bowling'

describe 'bowling' do 
  it 'will total the number of scores from 20 rounds' do
  bowling = Bowling.new
  bowling.play(9)
  expect(bowling.score).to eq(9)
  end
end
