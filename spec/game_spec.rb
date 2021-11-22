require 'game'

describe Game do
  
  let(:game) { Game.new(1) }  

  context 'I want the game to have 10 frames' do
    
    it 'ends' do
      expect{ game.start_game }.to output(include("Game Over")).to_stdout
      end
    end

    it 'runs 10 times' do
      expect(game).to receive(:start_frame).exactly(10).times
      game.start_game 
    end
  end
           
