require 'bowling_game'

describe BowlingGame do
  let(:turn_mock) { double('turn_manager') }
  let(:game) { BowlingGame.new(turn_mock) }
  let(:example_roll) { 5 }

  describe '#roll' do
    it 'accepts a roll' do
      expect(turn_mock).to receive(:move).with(example_roll)

      game.roll(example_roll)
    end
  end

  describe '#frame' do
    it 'returns a frame' do
      expect(turn_mock).to receive(:frame)

      game.frame
    end
  end
end
