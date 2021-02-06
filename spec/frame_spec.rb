require './lib/frame'

describe Frame do
  let(:frame) { described_class.new }
  let(:score) { 5 }

  describe '#add_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_score(score) }.to change { frame.total_score }.by score
    end
  end

  describe '#add_bonus_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_bonus_score(score) }.to change { frame.total_score }.by score
    end
  end

end
