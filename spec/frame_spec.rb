require './lib/frame'

describe Frame do
  let(:frame) { described_class.new }
  let(:score) { 5 }
  let(:bad_score) { 1 }
  let(:strike) { 10 }

  describe '#add_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_score(score) }.to change { frame.total_score }.by score
    end
    context 'when you get a spare' do
      it 'should set need_bonus to true' do
        frame.add_score(score)
        expect { frame.add_score(score) }.to change { frame.need_bonus? }.from(false).to(true)
      end
    end
    context 'when you get a strike' do
      it 'should set need_bonus to true' do
        expect { frame.add_score(strike) }.to change { frame.need_bonus? }.from(false).to(true)
      end
      it 'should set the frame as complete' do
        expect { frame.add_score(strike) }.to change { frame.complete? }.from(false).to(true)
      end
    end
    context 'when you get less than 10 over two bowls' do
      it 'should leave need_bonus as false' do
        2.times { frame.add_score(bad_score) }
        expect(frame.need_bonus?).to be false
      end
    end
    context 'when the first bowl is not a strike' do
      before { frame.add_score(score) }
      it 'should not be complete' do
        expect(frame).not_to be_complete
      end
      it 'should be completed by the second bowl' do
        expect { frame.add_score(score) }.to change { frame.complete? }.from(false).to(true)
      end
    end
    context 'when it is the final frame' do
      let(:final_frame) { Frame.new(final_frame: true) }
      context 'when you bowl less than 10 over the frame' do
        it 'should be completed by the second bowl' do
          final_frame.add_score(4)
          expect { final_frame.add_score(2) }.to change { final_frame.complete? }.from(false).to(true)
        end
      end
      context 'when you bowl a spare in the frame' do
        before { final_frame.add_score(8) }
        it 'should not be completed by the second bowl' do
          expect { final_frame.add_score(2) }.not_to(change { final_frame.complete? })
        end
      end
      context 'when you bowl a strike' do
        it 'should not complete the frame' do
          expect { final_frame.add_score(10) }.not_to(change { final_frame.complete? })
        end
      end
    end
  end

  describe '#add_bonus_score' do
    it 'should change the total score by the amount added' do
      expect { frame.add_bonus_score(score) }.to change { frame.total_score }.by score
    end
    context 'when the main score was a spare' do
      it 'should immediately set need_bonus to false' do
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
    context 'when it is the final frame' do
      let(:final_frame) { Frame.new(final_frame: true) }
      context 'when you scored a spare in the first two bowls' do
        before { 2.times { final_frame.add_score(5) } }
        it 'completes the frame' do
          expect { final_frame.add_bonus_score(score) }.to change { final_frame.complete? }.from(false).to(true)
        end
      end
      context 'when you scored a strike in the first throw' do
        before { final_frame.add_score(strike) }
        it 'does not immediately set the frame to complete' do
          expect { final_frame.add_bonus_score(score) }.not_to(change { final_frame.complete? })
        end
        it 'completes the frame with the second bonus' do
          final_frame.add_bonus_score(score)
          expect { final_frame.add_bonus_score(score) }.to change { final_frame.complete? }.from(false).to(true)
        end
      end
    end
  end

end
