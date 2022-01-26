# frozen_string_literal: true

require 'game'

describe Game do
  describe '.play' do
    let(:game) { Game.new }
    
    it 'handles spares' do
      21.times { expect(game).to receive(:gets).and_return('5') }
      game.play

      expect(game.scorecard).to be_a Array
      expect(game.scorecard[-1]).to eq 150
      expect(game.scorecard.length).to eq 11
    end

    it 'handles strikes' do
      12.times { expect(game).to receive(:gets).and_return('10') }
      game.play

      expect(game.scorecard).to be_a Array
      expect(game.scorecard[-1]).to eq 300
      expect(game.scorecard.length).to eq 11
    end

    it 'handles mixed games' do
      8.times { expect(game).to receive(:gets).and_return('5') }
      3.times { expect(game).to receive(:gets).and_return('10') }
      6.times { expect(game).to receive(:gets).and_return('3') }
      game.play

      expect(game.scorecard).to be_a Array
      expect(game.scorecard[-1]).to eq 152
      expect(game.scorecard.length).to eq 11
    end

    it 'starts game with an empty scorecard' do
      expect(game.scorecard).to be_empty
    end
  end
end
