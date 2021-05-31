require 'bowling'

 describe Scorecard do 

  before do 
    @game = Scorecard.new
  end
  describe '#score' do 

    it 'returns the score for a game' do 
      20.times{@game.bowl(0)}

      expect(@game.score).to eq(0)
    end

    it 'can return a game of all 1s' do
      20.times{@game.bowl(1)}
    
      expect(@game.score).to eq(20)
    end  

    it 'can return a score of a spare' do 
      @game.bowl(5)
      @game.bowl(5)
      @game.bowl(3)
      17.times{@game.bowl(0)}

      expect(@game.score).to eq(16)
    end

    it 'can return a strike score' do
      @game.bowl(10)
      @game.bowl(3)
      @game.bowl(4)
      16.times{@game.bowl(0)}

      expect(@game.score).to eq(24)
    end

    it 'can return the score for a perfect game' do 
      20.times{@game.bowl(10)}

      expect(@game.score).to eq(300)
    end
  end

 end