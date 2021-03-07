require 'game'

describe Game do

 it 'can roll gutter game' do
   game = Game.new
   20.times{game.roll(0)}
   expect(game.score).to eq 0
 end

 it 'can roll all ones' do
   game = Game.new
   20.times{game.roll(1)}
   expect(game.score).to eq 20
 end




end
