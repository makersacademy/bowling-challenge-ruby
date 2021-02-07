require 'score'

describe Score do

  describe '#calculate' do
    it 'Adds score of the total frame' do
      expect { subject.calculate([3, 4]) }.to change { subject.scores }.from([]).to([7])
    end

    it 'strikes are an X' do
      expect { subject.calculate([10]) }.to change { subject.scores }.from([]).to(['X'])
    end

    it 'spares are a /' do
      expect { subject.calculate([3, 7]) }.to change { subject.scores }.from([]).to(['/'])
    end

    it 'calculates final score' do
      expect { subject.calculate([3, 4], true) }
    end
  end

  describe '#spare_in_progress?' do
    it 'returns true if scores contains /' do
      subject.calculate([4, 6])
      expect(subject.spare_in_progress?).to be true
    end

    it 'returns false if spare not in spare_in_progress' do
      subject.calculate([1, 5])
      expect(subject.spare_in_progress?).to be false
    end
  end

  describe '#strike_in_progress?' do
    it 'returns true if scores array contains X' do
      subject.calculate([10])
      expect(subject.strike_in_progress?).to be true
    end

    it 'returns false if scores array contains X' do
      subject.calculate([3, 1])
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

  describe '#update_normal' do
    it 'calls spare if spare needs updating' do
      subject.calculate([3, 7])
      expect(subject.spare_in_progress?).to be true
      expect(subject).to receive(:update_spare)
      subject.update_if_needed([4])
    end

    it 'calls strike if strike needs updating' do
      subject.calculate([10])
      expect(subject).to receive(:update_strike)
      subject.update_if_needed([3, 4])
    end

    it 'calls consecative strike if consec strike needs updating' do
      subject.calculate([10])
      subject.calculate([10])
      expect(subject).to receive(:update_consec_strikes)
      subject.update_if_needed([4])
    end
  end

end
