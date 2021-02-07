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

end
