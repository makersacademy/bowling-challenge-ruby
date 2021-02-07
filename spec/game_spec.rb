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

    it "doesn't create an 11th frame" do
      20.times { test_game.latest_roll(5) }
      expect { test_game.latest_roll(5) }.to raise_error 'Game finished'
    end

    it 'returns the frame score to the player after each frame' do
      expect(test_game.latest_roll(6)).to eq 'Current score: frame_1 6'
    end

    it 'returns the final score at the end of the game' do
      19.times { test_game.latest_roll(1) }
      expect(test_game.latest_roll(1)).to eq 'Final score: 20'
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

  describe '.total_score' do
    it 'returns the overall score of the player' do
      6.times { test_game.latest_roll(5) }
      expect(test_game.total_score).to eq 30
    end

    it "adds on the bonus score if there's a strike" do
      test_game.latest_roll(10)
      test_game.latest_roll(4)
      test_game.latest_roll(1)
      expect(test_game.total_score).to eq 20
    end

    it "rolls over the bonus if there's two strikes in a row" do 
      test_game.latest_roll(10)
      test_game.latest_roll(10)
      test_game.latest_roll(3)
      test_game.latest_roll(3)
      expect(test_game.total_score).to eq 45 
    end 

    it "adds on the bonus score if there's a spare" do
      test_game.latest_roll(5)
      test_game.latest_roll(5)
      test_game.latest_roll(5)
      expect(test_game.total_score).to eq 20
    end
  end
end
