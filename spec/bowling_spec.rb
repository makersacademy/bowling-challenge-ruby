require 'bowling'
require 'rspec'

describe 'Bowling game logic' do
   before do
     @game = BowlingGame.new
   end

   it('can roll a #gutter game') do
     20.times{@game.roll 0}
     expect(@game.score).to eq 0    
   end

   it('can roll only #one pin') do
     10.times{@game.roll 1}
     10.times{@game.roll 2}
     expect(@game.score).to eq 30    
   end

   it('can roll a #spare') do
     @game.roll 4
     @game.roll 6
     @game.roll 7
     17.times{@game.roll 0}
     expect(@game.score).to eq 24     
   end

   it('can roll a #strike') do
    @game.roll 10
    @game.roll 8
    @game.roll 6
    16.times{(@game.roll 1)}
    expect(@game.score).to eq 54
   end

   it('can roll a #perfectgame') do
    12.times{(@game.roll 10)}
    expect(@game.score).to eq 300 
   end

   it('is a #10thFrame') do
    18.times{(@game.roll 0)}
    @game.roll 10
    @game.roll 10
    @game.roll 10
    expect(@game.score).to eq 30 
   end
   
   it('roll all #spares') do
     21.times{(@game.roll 5)}
     expect(@game.score).to eq 150
   end
end