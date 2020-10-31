require 'game'

describe 'Bowling scorecard features' do

  let(:game) { Game.new }

    it 'can store the score of a single roll and display it for the user' do
      game.record_roll(5)
      expect(game.running_score).to eq(5)
    end

    it 'can display the correct score after multiple frames (no strikes or spares)' do
      game.record_roll(5)
      game.record_roll(2)
      game.record_roll(4)
      game.record_roll(1)
      game.record_roll(3)
      game.record_roll(6)
      expect(game.running_score).to eq(21)
    end

    it 'can display the correct score over multiple frames (including spares)' do
      game.record_roll(5)
      game.record_roll(2)
      game.record_roll(7)
      game.record_roll(3)
      game.record_roll(3)
      game.record_roll(6)
      expect(game.running_score).to eq(29)
    end
  end
