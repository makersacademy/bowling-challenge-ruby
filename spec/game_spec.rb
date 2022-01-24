# frozen_string_literal: true

require 'game'

describe Game do
  describe '.play' do
    let(:game) { Game.new }
    
    it 'handles non-strikes' do
      21.times { expect(game).to receive(:gets).and_return('5') }
      game.play

      expect(game.frames).to be_a Array
      expect(game.frame_number).to eq 11
    end

    it 'handles strikes' do
      11.times { expect(game).to receive(:gets).and_return('10') }
      game.play

      expect(game.frames).to be_a Array
      expect(game.scorecard.sum).to eq 300
    end

    it 'raises error when too many pins have been knocked down' do
      allow(game).to receive(:gets).and_return('42')

      expect(game.play).to raise_error 'There aren\'t that many pins!'
    end

    it 'creates a new scorecard at the end of the game' do
      11.times { expect(game).to receive(:gets).and_return('10') }
      scorecard = game.play

      expect(scorecard).to be_a Scorecard
    end
  end
end
