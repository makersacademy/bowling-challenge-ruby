require 'game'
require 'frame'

describe Game do
  
  let(:frame_class) { class_double(Frame, :new => true).as_stubbed_const }
  let(:new_game) { described_class.new(frame_class)}

  describe '#initialise' do
    it 'initializes with empty game array' do
      expect(new_game.game).to eq []
    end
  end

  describe '#roll' do
    it 'updates score' do
      allow(new_game).to receive(:frame_complete?) { false }
      expect(new_game.roll(6)).to eq nil
    end
  end

  describe '#frame_complete?' do
    it 'does not return true when strike' do
      allow(new_game).to receive(:strike?) { true }
      expect(new_game.frame_complete?).to eq true
    end
  end
end