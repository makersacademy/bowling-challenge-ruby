require 'scorecard'

describe ScoreCard do
  let(:frame) { double 'Frame', fallen_pins: nil, current_is_a_strike?: nil, 
  no: 1, current_is_a_spare?: nil }
  let(:bonus_log) { double 'BonusLog', log_strike_bonus: nil }
  let(:scorecard) { described_class.new(frame: frame, bonus_log: bonus_log) }

  describe '#enter_pins' do
    it 'returns Invalid Entry if first pin entry is > 10' do
      expect(scorecard.enter_pins(11)).to eq 'Invalid Entry'
    end
    
    it 'passes the number of fallen pins to the frame' do
      expect(frame).to receive(:fallen_pins).with 3
      scorecard.enter_pins(3)
    end
  end

  describe '#add_to_bonus_log' do 
    context 'current frame is a strike' do
      it 'adds a strike bonus to the bonus log' do
        allow(frame).to receive(:current_is_a_strike?).and_return(:true)
        expect(bonus_log).to receive(:log_strike_bonus)
        scorecard.add_to_bonus_log
      end
    end

    context 'current frame is a spare' do
      it 'adds a spare bonus to the bonus log' do
        allow(frame).to receive(:current_is_a_spare?).and_return(:true)
        expect(bonus_log).to receive(:log_spare_bonus)
        scorecard.add_to_bonus_log
      end
    end
  end
end
