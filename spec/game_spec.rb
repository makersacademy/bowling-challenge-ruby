# frozen_string_literal: true

require './lib/game'

describe Game do
  let(:test_game) { Game.new }
  describe '.new_frame' do
    it 'creates a new frame' do
      test_game.new_frame
      expect(test_game.frames.length).to eq 1
    end

    it 'creates a frame when the previous frame is complete' do 
      test_game.latest_roll(5)
      test_game.latest_roll(4)
      test_game.latest_roll(3)
      expect(test_game.frames.last.rolls).to eq [3]
    end 
  end

  describe '.latest_roll' do 
    it 'adds a score to the current frame' do 
      test_game.latest_roll(4)
      expect(test_game.frames[0].rolls).to eq [4]
    end 
  end 

  describe '.scores' do 
    it 'returns the frame with the rolled scores' do 
      test_game.latest_roll(4)
      test_game.latest_roll(4)
      expect(test_game.scores[:frame1]).to eq 8
    end 
  end 
end
