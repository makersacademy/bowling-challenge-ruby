require_relative '../lib/game'

describe Game do

  let(:game) { described_class.new }

  context '#frame' do
    it 'increases the round (frame) number' do
      expect(subject.change_frame).to eq 2
    end
  end

  context '#total_score' do
    it 'calculates the users total score' do
      game.frame.knocked_down_pins(5)
      game.frame.knocked_down_pins(5)
      expect(game.total_score).to eq 10
    end
  end

  context '#spare?' do
    it 'returns true if user achieved a spare' do
      game.frame.knocked_down_pins(6)
      game.frame.knocked_down_pins(4)
      expect(game.spare?).to be_truthy
    end

    it 'returns false if user did not achieve a spare' do
      game.frame.knocked_down_pins(6)
      game.frame.knocked_down_pins(3)
      expect(game.spare?).to be_falsey
    end
  end

  context '#strike?' do
    it 'returns true if user acheived a strike' do
      game.frame.knocked_down_pins(10)
      expect(game.strike?).to be_truthy
    end

    it 'returns false if user did not acheive a strike' do
      game.frame.knocked_down_pins(5)
      game.frame.knocked_down_pins(5)
      expect(game.strike?).to be_falsey
    end
  end
end