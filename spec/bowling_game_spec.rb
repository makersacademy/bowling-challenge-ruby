require 'bowling_game'

describe BowlingGame do
  it 'starts a new game' do
    game = BowlingGame.new
  end

  context 'initialize game' do
    it 'has an empty array' do
      game = BowlingGame.new
      game.score_card
            
      expect(game.score_card).to be_empty
    end

    it 'takes the first score' do
      game = BowlingGame.new
      game.roll(6)

      expect(game.score_card).to eq [6]
    end

    
  end
end
