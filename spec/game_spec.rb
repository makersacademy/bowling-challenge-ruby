require './lib/game'
require './lib/player'

describe 'game' do 
  let(:game) { Game.new("peter", "george", "luke")}

  describe 'switch player' do 
    it 'changes the player index within the game' do 
      game.play(2)
      game.play(3)

      expect{game.switch_player}.to change { game.index }
    end 
  end 

  describe 'current' do 
    it 'returns the current player' do 
      expect(game.current).to be_a Player 
    end 
  end 

  describe 'scoreboard' do 
    it 'returns an array of players' do 
      expect(game.scoreboard).to be_a Array 
      expect(game.scoreboard[0]).to be_a Player
    end 
  end 

  describe 'next player' do 
    it 'returns a message saying the game is completed after the last turn' do 
      30.times {game.play(10)}
      expect(game.play(5)).to eq "Game is completed"
    end 
  end 
end 