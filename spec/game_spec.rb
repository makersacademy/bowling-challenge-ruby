require 'game'
require 'frame'

describe Game do
  
  let(:frame) { double(no_of_rolls: 0, roll_1_score: 0) }
  let(:new_game) { described_class.new(frame)}

  describe '#initialise' do
    it 'initializes with empty game array' do
      expect(new_game.game).to eq []
    end
  end

  # work out how to do a test that correctly uses frame methods
  describe '#roll' do
    it 'updates score' do
      allow(frame).to receive(:add_roll_1_score)
      allow(frame).to receive(:add_roll)
      expect(new_game.roll(6)).to eq nil
    end
  end

  # work out how to do a test that correctly uses frame methods
  describe '#update_score' do
    it 'takes the score as an argument' do
      expect(new_game).to respond_to(:update_score).with(1).argument
    end
    # test for score update tbc
    # it 'adds score to current frame' do
    #   new_game.update_score(6)
    # end
  end

  describe '#frame_complete?' do
    it 'does not return true if frame not complete' do
      expect(new_game.frame_complete?).not_to eq true
    end
  end

  describe '#check_roll' do
    it 'returns correct roll number' do
      expect(new_game.check_roll).to eq(0)
    end
  end
end