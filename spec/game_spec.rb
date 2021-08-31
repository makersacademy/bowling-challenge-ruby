require 'game'
describe Game do
  
  let(:frame) { double(no_of_rolls: 1, roll_1_score: 0) }
  let(:new_game) { described_class.new(frame)}
  describe '#initialise' do
    it 'initializes with empty game array' do
      expect(new_game.game).to eq []
    end
  end

  describe '#add_roll_1_score' do
    it 'returns correct roll number' do
      new_game.add_roll_1_score(10)
      expect(frame.roll_1_score).to eq(10)
    end
  end

  describe '#check_roll' do
    it 'returns correct roll number' do
      expect(new_game.check_roll).to eq(1)
    end
  end
end