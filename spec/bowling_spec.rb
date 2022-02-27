# require_relative '../lib/bowling'
# require 'spec_helper'
# describe Bowling do
#   before do
#     @game = Bowling.new
#   end
#   describe 'Bowling' do 
#     it 'creates a gutter game' do
#       20.times{@game.roll 0}
#       expect(@game.game_score).to eq 0
#     end
#     it 'can roll all 5s' do 
#       20.times{@game.roll 5}
#       expect(@game.game_score).to eq 100
#     end
#     it 'can roll all strikes' do
#       20.times{@game.roll 10}
#       expect(@game.game_score).to eq 300
#     end
#     it 'can roll all 1s' do 
#       20.times{@game.roll 1}
#       expect(@game.game_score).to eq 20
#     end
#     it 'can roll one strike and all 1s' do
#       2.times{@game.roll 1}
#       @game.roll(10)
#       17.times{@game.roll 1}
#       expect(@game.game_score).to eq 30
#     end  
 
#     # it 'can roll one the ball as a strike and get two extra rolls' do
#     #   14.times{@game.roll 1}
#     #   @game.roll(10)
#     #   5.times{@game.roll 1}
#     #   expect(@game.game_score).to eq 36
#     # end 
#   end
# end