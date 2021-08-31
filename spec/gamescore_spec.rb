require 'gamescore'

describe GameScore do

  let(:gamescore) { described_class.new }
  let(:framescore1_double) { double("I'm a double", { frame_rolls: [6, 2], clear: [] }) }
  let(:framescore2_double) { double("I'm a double", { frame_rolls: [5, 3], clear: [] }) }
  let(:framescore3_double) { double("I'm a double", { frame_rolls: [1, 8], clear: [] }) }
  let(:frame_hash) { {
    frame_1: [],
    frame_2: [],
    frame_3: [],
    frame_4: [],
    frame_5: [],
    frame_6: [],
    frame_7: [],
    frame_8: [],
    frame_9: [],
    frame_10: [],
    }
  }

  describe '#initialize' do
    it 'full game frame hash for tracking frame scores' do
      expect(gamescore.game).to eq(frame_hash)
    end
  end

  describe '#input_frame_score' do
    it 'saves frame scores to a 2 element array' do
      gamescore.input_frame_score(framescore1_double.frame_rolls[0], framescore1_double.frame_rolls[1])
      expect(gamescore.game.first).to include([6, 2])
    end
  end

  describe '#clear_frame_rolls' do
    it 'clears the frame' do
      gamescore.input_frame_score(framescore1_double.frame_rolls[0], framescore1_double.frame_rolls[1])
      allow(framescore1_double).to receive(:clear).and_return([])
      gamescore.clear_frame_rolls
      gamescore.input_frame_score(framescore2_double.frame_rolls[0], framescore2_double.frame_rolls[1])
      expect { framescore1_double }.not_to raise_error
    end
  end

  describe '#dispaly_frame_points' do
    it 'should sum the total points scored for the frame and display them' do
      gamescore.input_frame_score(framescore1_double.frame_rolls[0], framescore1_double.frame_rolls[1])
      expect(gamescore.display_frame_points).to eq(8)
    end
  end

  describe '#total_points' do
    it 'should sum the total points scored for the entire game and display them' do
      gamescore.input_frame_score(framescore1_double.frame_rolls[0], framescore1_double.frame_rolls[1])
      allow(framescore1_double).to receive(:clear).and_return([])
      gamescore.clear_frame_rolls
      gamescore.input_frame_score(framescore2_double.frame_rolls[0], framescore2_double.frame_rolls[1])
      gamescore.clear_frame_rolls
      gamescore.input_frame_score(framescore3_double.frame_rolls[0], framescore3_double.frame_rolls[1])
      expect(gamescore.display_total_points).to eq(25)
    end
  end

end
