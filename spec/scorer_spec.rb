require 'scorer'

describe Scorer do
  describe '#calculate' do
    it 'sums total of frame and pushes to scores array' do
      expect { subject.calculate([3, 4]) }.to change { subject.scores }.from([]).to([7])
    end

    it 'inserts X into scores for a strike' do
      expect { subject.calculate([10]) }.to change { subject.scores }.from([]).to(['X'])
    end

    it 'inserts / into scores for a spare' do
      expect { subject.calculate([3, 7]) }.to change { subject.scores }.from([]).to(['/'])
    end

    it 'calculates final score differently...' do
      expect { subject.calculate([3, 4], true) }
    end
  end

  describe '#spare_in_progress?' do
    it 'returns true if scores contains /' do
      subject.calculate([3, 7])
      expect(subject.spare_in_progress?).to be true
    end

    it 'returns false if spare not in spare_in_progress' do
      subject.calculate([3, 5])
      expect(subject.spare_in_progress?).to be false
    end
  end

  describe '#strike_in_progress?' do
    it 'returns true if scores array contains X' do
      subject.calculate([10])
      expect(subject.strike_in_progress?).to be true
    end

    it 'returns false if scores array contains X' do
      subject.calculate([3, 4])
      expect(subject.strike_in_progress?).to be false
    end
  end

  describe '#consecutive_strikes?' do
    it 'returns true for consecutive strikes' do
      2.times { subject.calculate([10]) }
      expect(subject.consecutive_strikes?).to be true
    end

    it 'returns false if no consecutive strikes' do
      subject.calculate([10])
      expect(subject.consecutive_strikes?).to be false
    end
  end

  describe '#update_if_needed' do
    it 'calls #update_spare if spare needs updating' do
      subject.calculate([3, 7])
      expect(subject.spare_in_progress?).to be true
      expect(subject).to receive(:update_spare)
      subject.update_if_needed([4])
    end

    it 'calls #update if strike needs updating' do
      subject.calculate([10])
      expect(subject).to receive(:update_strike)
      subject.update_if_needed([3, 4])
    end

    it 'calls #update if consec strike needs updating' do
      subject.calculate([10])
      subject.calculate([10])
      expect(subject).to receive(:update_consec_strikes)
      subject.update_if_needed([4])
    end
  end

  describe '#update_spare' do
    it 'updates "/" to score following spare' do
      subject.calculate([3, 7])
      expect { subject.update_spare(4) }.to change { subject.scores }.from(['/']).to([14])
    end
  end

  describe '#update_strike' do
    it "updates 'X' to score following strike" do
      subject.calculate([10])
      expect { subject.update_strike([3, 4]) }.to change { subject.scores }.from(['X']).to([17])
    end
  end

  describe '#update_consec_strikes' do
    it 'updates X to score following consecutive_strikes' do
      2.times { subject.calculate([10]) }
      expect { subject.update_consec_strikes(4) }.to change { subject.scores }.from(['X', 'X']).to([24, 'X'])
    end
  end

  describe '#calculate final frame' do
    it 'sums final frame' do
      11.times { subject.calculate([10]) }
      expect { subject.calculate_final_frame([10, 10, 10], 10) }.to change { subject.scores }
    end

    it 'inserts final frame total in correct place' do
      11.times { subject.calculate([10]) }
      subject.calculate_final_frame([10, 10, 10], 10)
      expect(subject.total).to eq 300
    end
  end

  describe '#total' do
    it 'returns final total' do
      10.times { subject.calculate([3, 4]) }
      expect(subject.total).to eq 70
    end
  end
end
