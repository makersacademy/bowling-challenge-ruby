# frozen_string_literal: true

require 'game'

describe Game do
  subject(:game) { Game.new }
  let(:max_pins) { Game::MAX_PINS }
  let(:max_frames) { Game::MAX_FRAMES }

  describe '.roll' do
    it 'takes the first roll score' do
      expect(game.roll(4)).to eq 4
    end

    it 'starts a new frame after 2 rolls' do
      4.times { game.roll(4) }
      expect(game.frames.length).to eq 2
    end

    it 'adds the knocked pins to an array' do
      game.roll(4)
      game.roll(2)
      expect(game.frames.first).to include 4 && 2
    end
  end

  describe '.frame_score' do
    it 'calculates the frame score after 1 roll' do
      game.roll(4)
      expect(game.frame_score).to eq 4
    end

    it 'calculates the frame score after 2 rolls' do
      2.times { game.roll(4) }
      expect(game.total_score).to eq 8
    end

    it 'resets and calculates the frame score after 3 rolls' do
      3.times { game.roll(4) }
      expect(game.frame_score).to eq 4
    end
  end

  describe '.strike' do
    it 'skips the frame after the strike' do
      game.roll(max_pins)
      expect(game.frames.first).to include max_pins
      2.times { game.roll(4) }
      expect(game.frames.length).to eq 2
    end

    it 'calculates strike score correctly' do
      game.roll(max_pins)
      2.times { game.roll(4) }
      expect(game.total_score).to eq max_pins + 16
    end
  end

  describe '.spare' do
    it 'calculates spare correctly' do
      game.roll(max_pins - 4)
      3.times { game.roll(4) }
      expect(game.total_score).to eq max_pins + 12
    end
  end

  describe 'edge cases' do
    it 'raises an error when trying to roll after the last frame' do
      (max_frames * 2).times { game.roll(4) }
      expect { game.roll(4) }.to raise_error(IncorrectRollError, 'The game is over')
    end
  end
end
