# require 'bowling'

# describe 'Feature tests' do

#   describe 'a user inputs the score for a roll' do
#     it 'saves the score of a roll to users total' do
#       game = Bowling.new
#       game.roll(3)
#       game.roll(2)
#       expect(game.total_score).to eq 5
#     end
#   end

#   describe 'a player rolls up to twice per frame' do
#     it 'when roll 1 score is less than 10, player can roll again' do
#       game = Bowling.new
#       game.roll(8)
#       expect(game.frame).to eq 1
#       game.roll(2)
#       expect(game.frame).to eq 2
#     end
#   end
# end
