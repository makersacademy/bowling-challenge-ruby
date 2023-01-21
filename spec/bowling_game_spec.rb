require_relative '../lib/bowling_game'



RSpec.describe BowlingGame do 


  before do 
     @game = BowlingGame.new
  end

    it 'rolls gutter game 20 times and hits no pins' do 
       20.times {@game.roll(0)}

       expect(@game.score).to eq(0)
    end 
    it 'each roll knocks only one pin' do 
        20.times {@game.roll(1)}

        expect(@game.score).to eq(20)
    end 
    it 'gets a strike' do 
        @game.roll(10)
        @game.roll(1)
        @game.roll(2)
        16.times {@game.roll(0)}
        expect(@game.score).to eq(16)
    end    
    it 'gets a spare' do 
        @game.roll(3)
        @game.roll(7)
        @game.roll(7)
        @game.roll(2)
        17.times {@game.roll(0)}
        expect(@game.score).to eq(26)
    end
    it 'frame without spare or strike' do 
        @game.roll(2)
        @game.roll(3)
        18.times {@game.roll(0)}
        expect(@game.score).to eq(5)
    end 
    it 'scores a prefect game' do 
        12.times {@game.roll(10)}
        expect(@game.score).to eq(300)
    end 


end 