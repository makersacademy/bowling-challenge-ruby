require './lib/frame'

describe Frame do
  let(:frame) { described_class.new }
  let(:score) { 5 }
  let(:strike) { 10 }

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
    context 'when you get a strike' do
      it 'should set bonus_needed to true' do
        expect { frame.add_score(strike) }.to change { frame.need_bonus? }.from(false).to(true)
      end
    end
  end

  describe '#add_bonus_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_bonus_score(score) }.to change { frame.total_score }.by score
    end
    context 'when it is not the final frame' do
      context 'when the main score was a spare' do
        it 'should immediately set bonus_needed to false' do
          2.times { frame.add_score(score) }
          expect { frame.add_bonus_score(score) }.to change { frame.need_bonus? }.from(true).to(false)
        end
      end
      context 'when the main score was a strike' do
        before { frame.add_score(strike) }
        it 'should leave need_bonus true for first addition' do
          expect { frame.add_bonus_score(score) }.not_to(change { frame.need_bonus? })
        end
        it 'should change need_bonus to false after second addition' do
          frame.add_bonus_score(score)
          expect { frame.add_bonus_score(score) }.to change { frame.need_bonus? }.from(true).to(false)
        end
      end
    end
  end

end
