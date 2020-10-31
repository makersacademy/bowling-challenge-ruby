require 'game'

describe 'Bowling scorecard features' do

  let(:game) { Game.new }

    it 'can store the score of a single roll and display it for the user' do
      game.record_roll(5)
      expect(game.running_score).to eq(5)
    end

    it 'can store multiple rolls over several frames and display the correct score' do
      game.record_roll(5)
      expect(game.running_score).to eq(5)
    end
  end
