require 'game'

describe Game do

  context 'I want the game to have 10 frames' do
    
    it 'ends' do
      expect{described_class.start_game}.to output("Game Over\n").to_stdout
    end
end        
  let(:game) { described_class.new }
  it 'can score a 0 in a frame' do 
    2.times { game.bowl(0) }
    expect(game.score).to eq 0 
  end
end      