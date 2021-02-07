# frozen_string_literal: true

require 'game'

describe Game do
  let(:game) { Game.new }
  describe '.bowl' do
    it 'adds score to the total' do
      game.bowl(6)
      expect(game.total_score).to eq 6
    end
  end
  describe '.current_frame_number' do
    it 'returns two after two non-ten rolls' do 
      game.bowl(7)
      game.bowl(2)
      game.bowl(5)
      expect(game.current_frame_number).to eq 2
    end
    it 'returns two after a strike' do 
      game.bowl(10)
      game.bowl(1)
      expect(game.current_frame_number).to eq 2
    end
  end
  describe '.update_previous_frames' do 
    it 'changes frame 1 score after following bowls if frame 1 is a spare' do
      game.bowl(3)
      game.bowl(7)
      game.bowl(5)
      expect(game.frames["frame_1"].score).to eq 15
    end
  end
end
