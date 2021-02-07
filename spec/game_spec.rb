require './lib/game.rb'

describe Game do 
  let(:test_game) { Game.new }
  describe '.new_frame' do 
    it 'creates a new frame' do 
      test_game.new_frame
      expect(test_game.frames.length).to eq 1
    end 
  end 
end 