require 'game'

describe Game do
  
  let(:frame) { instance_double(Frame, :frame_total => 5)}
  let(:new_game) { described_class.new(frame)}

  describe '#initialise' do
    it 'initializes with empty game array' do
      expect(new_game).to have_attributes(current_frame: frame, game: [])
    end
  end

  describe '#roll' do
    it 'call add_score method on current frame' do
      expect(new_game.current_frame).to receive(:add_score)
      allow(new_game.current_frame).to receive(:rolls) { [] }
      new_game.roll(5) 
    end
  end

  describe '#score_total' do
    it 'updates score' do
      new_game.game << new_game.current_frame
      expect(new_game.score_total).to eq (5)
    end
  end
  
end