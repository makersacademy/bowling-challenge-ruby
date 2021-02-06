require './lib/frame'

describe Frame do
  let(:frame) { described_class.new }
  let(:score) { 5 }

  describe '#add_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_score(score) }.to change { frame.total_score }.by score
    end
    context 'when you get a spare' do
      it 'should set bonus_needed to true' do
        frame.add_score(score)
        expect { frame.add_score(score) }.to change { frame.need_bonus? }.from(false).to(true)
      end
    end
  end

  describe '#add_bonus_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_bonus_score(score) }.to change { frame.total_score }.by score
    end
  end

end
