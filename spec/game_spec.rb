require_relative '../lib/game'

describe Game do
  it 'can initialize with 10 frames inside @frames array' do
    game = Game.new
    expect(game.frames.length).to eq(10)
  end
  
end    
