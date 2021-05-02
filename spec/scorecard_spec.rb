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
end