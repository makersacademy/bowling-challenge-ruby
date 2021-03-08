require 'scorecard'

describe Scorecard do
   it 'stores rolls' do
     this_game = Scorecard.new
     this_game.input_rolls('Frame 1', 2, 4)
     expect(this_game.scorecard).to eq([{'Frame 1' => [2, 4]}])
   end
  end

  
#  it 'allows 1-2 rolls to be inputted' do
#    expect(subject).to receive(:input_rolls).with(any_args)

#
#
#

#  it 'adds rolls and total score to frame scorecard for one frame' do

#    expect(subject.score).to eq([2, 6, 8])
#  end

# it can input bonus points.
