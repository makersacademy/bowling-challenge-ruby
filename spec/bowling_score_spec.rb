require 'bowling_score'

describe BowlingGame do

  describe '#roll' do

    it 'ends turn when a strike is scored' do
      subject.roll(10)
      expect(subject.in_turn).to eq false
    end

    it 'ends the turn when both rolls are done' do
      subject.roll(1)
      subject.roll(1)
      expect(subject.in_turn).to eq false
    end

    it 'adds the score to the total' do
      subject.roll(1)
      subject.roll(1)
      expect(subject.total_score).to eq 2
    end

    it 'gives two bonus rolls when a strike is rolled' do
      subject.roll(10)
      subject.roll(1)
      subject.roll(1)
      expect(subject.total_score).to eq 14
    end

  end

end
