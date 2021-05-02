require 'scorecard'

describe Scorecard do
  describe '#add_score' do
    context 'first roll' do
      it 'adds score to scorecard' do
        subject.add_score(7)
        expect(subject.scorecard[0][0]).to eq 7
      end

      it 'sets @roll to 2 after it is called' do
        expect{ subject.add_score 2 }.to change { subject.roll }.by 1
      end

      it 'if score is 10 (strike) begin next frame' do
        expect { subject.add_score(10) }.to change { subject.frame }.by 1
      end

      it 'if score is 10 (strike) next frame starts with @roll = 1' do
        subject.add_score(10)
        expect(subject.roll).to eq 1 
      end
    end

    context 'second roll' do
      it 'next frame after second roll' do
        subject.add_score(7)
        expect{ subject.add_score 2 }.to change { subject.frame }.by 1
      end
      it 'adds score to sub-array based on the frame' do
        3.times { subject.add_score(7) }
        subject.add_score(4)
        expect(subject.scorecard[1][1]).to eq 4
      end
    end
  end

  describe '#calculate_score' do
    it 'can calculate a simple score with no bonuses' do
      subject.add_score(7) 
      subject.add_score(1) 
      subject.add_score(8) 
      subject.add_score(0)
      expect(subject.calculate_score).to eq 16
    end

    it 'takes into account a strike and gives bonus' do
      subject.add_score(10) 
      subject.add_score(1) 
      subject.add_score(8) 
      subject.add_score(0)
      subject.add_score(5)
      expect(subject.calculate_score).to eq 33
    end

    it 'takes into account a spare' do
      subject.add_score(9) 
      subject.add_score(1) 
      subject.add_score(8) 
      subject.add_score(0)
      subject.add_score(5)
      expect(subject.calculate_score).to eq 31
    end

    it 'correctly calculates for strike in 10th frame' do
      18.times { subject.add_score(3) }
      subject.add_score 10
      subject.add_score 4
      subject.add_score 6
      expect(subject.calculate_score).to eq 74
    end

    it 'correctly calculates for spare in 10th frame' do
      18.times { subject.add_score(3) }
      subject.add_score 6
      subject.add_score 4
      subject.add_score 6
      expect(subject.calculate_score).to eq 70
    end

    it 'perfect game' do
      12.times { subject.add_score(10) }
      expect(subject.calculate_score).to eq 300
    end

    it 'gutter game' do
      20.times { subject.add_score 0 }
      expect(subject.calculate_score).to eq 0
    end
  end
end