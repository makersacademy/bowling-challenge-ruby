require 'bowling'

describe Bowling do
  let(:bowling) { Bowling.new}
   
  it 'returns number of knocked down pins' do
    bowling.roll(10)
    expect(bowling.score).to eq 10
  end
end

# Count and sum the scores of a bowling game for one player. For this challenge
# The player has a strike if he knocks down all 10 pins with the first roll in a frame.
# 10 frames(chances) to knock down 10 pins
# input(roll) ------- output(score)
# player --> roll(pins) ---> score

# play.frame.shot(randomsampleof numbers between 1 and 10)
# keep track of bowl.roll(pins)
# there are 10 frames in the game and each frame has 2 rolls(10 pins are present in each frame)
# The player has a strike if he knocks down all 10 pins with the first roll in a frame.
# The player has a spare if the knocks down all 10 pins with the two rolls of a frame.
# if pins aren't knocked within the 2 rolls of each frame, new 10 pins are presented

# as a player
# so that i can knock down pins
# i want to be able to roll
