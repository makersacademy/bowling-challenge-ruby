require 'bowling_game'

describe BowlingGame do
    require 'bowling_game'

    describe BowlingGame do
      describe '.all' do
        before do
          @game = BowlingGame.new
        end
        
        it 'Can roll gutter game' do
          20.times { @game.roll(0) }
          expect(@game.score).to eq (0)
        end
    
        it 'Can roll all ones' do
          20.times { @game.roll(1) }
          expect(@game.score).to eq (20)
        end
    end
    end
end