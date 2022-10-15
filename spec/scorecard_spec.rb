require 'scorecard'

RSpec.describe Scorecard do
  describe '#add' do
   it 'adds 2 rolls to rolls array' do
    scorecard = Scorecard.new
    roll1 = Roll.new('4')
    roll2 = Roll.new('5')
    scorecard.add(roll1)
    scorecard.add(roll2)
    expect(scorecard.rolls_arr).to eq [roll1, roll2]
   end
  end
end