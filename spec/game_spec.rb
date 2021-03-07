require 'game'

describe Game do

  before do
    @game = Game.new
  end

 it 'can roll gutter game' do

   20.times{@game.roll(0)}
   expect(@game.score).to eq 0
 end

 it 'can roll all ones' do

   20.times{@game.roll(1)}
   expect(@game.score).to eq 20
 end

 it 'can roll a spare' do
   @game.roll(5)
   @game.roll(5)
   @game.roll(3)
   17.times{@game.roll(0)}
   expect(@game.score).to eq 16
 end



end
