require 'score_card'

describe ScoreCard do
  let(:frame_instance) { double 'Frame Instance', strike?: nil, spare?: nil, complete?: true }

  let(:frame) { 
    double 'Frame', accept_roll?: true, fallen_pins: nil, no: 1, current_frame: frame_instance, 
    calculate_score: nil, end_game?: nil, frame_totals: [1, 2, 3, 4], strike?: nil, spare?: nil, 
    no10_complete?: nil, frame10_valid?: nil
  }

  let(:bonus_log) { double 'BonusLog', log_strike_bonus: nil, check_for_frames: nil }
  
  let(:scorecard) { described_class.new(frame: frame, bonus_log: bonus_log) }

  describe '#enter_pins' do
    it 'validates the roll' do
      expect(frame).to receive(:accept_roll?).with 11
      expect(scorecard.enter_pins(11))
    end
    
    it 'passes the number of fallen pins to the frame' do
      expect(frame).to receive(:fallen_pins).with 3
      scorecard.enter_pins(3)
    end
  end

  describe '#add_to_bonus_log' do 
    context 'current frame is a strike' do
      it 'adds a strike bonus to the bonus log' do
        scorecard.progress_game
        allow(frame).to receive(:strike?).and_return(:true)
        expect(bonus_log).to receive(:log_strike_bonus)
        scorecard.add_to_bonus_log
      end
    end

    context 'current frame is a spare' do
      it 'adds a spare bonus to the bonus log' do
        scorecard.progress_game
        allow(frame).to receive(:spare?).and_return(:true)
        expect(bonus_log).to receive(:log_spare_bonus)
        scorecard.add_to_bonus_log
      end
    end
  end

  describe '#frames_to_add_bonus' do
    it 'checks the BonusLog for frames' do
      expect(bonus_log).to receive(:check_for_frames)
      scorecard.frames_to_add_bonus  
    end
  end

  describe '#calculate score' do
    it 'sums the totals of all frames' do
      expect(scorecard.calculate_score).to eq(10)
    end
  end
end
