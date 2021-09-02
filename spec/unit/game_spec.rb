require 'game'

describe Game do

  let(:first_frame) { Game::FIRST_FRAME }
  let(:last_frame) { Game::LAST_FRAME }
  let(:frame) { double :frame }
  let(:scorecard) { double :scorecard }
  let(:frame_class) { class_double(Frame).as_stubbed_const }
  let(:scorecard_class) { class_double(Scorecard).as_stubbed_const }
    
  describe '#roll' do

    before(:each) do
      (first_frame..Game::LAST_FRAME).each do |id|
        expect(frame_class).to receive(:new).with(id, last_frame) { frame }
      end
      allow(frame).to receive(:roll)
      allow(frame).to receive(:full?)
      subject { described_class.new }
    end

    it 'invokes roll method' do
      expect(frame).to receive(:roll).with(7)
      subject.roll(7)
    end
   
    it 'increments frame if frame full & raises error when game complete' do
      first_frame.upto(last_frame - 1) do 
        allow(frame).to receive(:full?).and_return(false, true)
        subject.roll(1)
      end
      allow(frame).to receive("full?").and_return(true)
      expect { subject.roll(1) }.to raise_error 'Game complete'
    end
  end

  describe '#scorecard' do

    it 'invokes scorecard_printer' do
      expect(scorecard_class).to receive(:new) { scorecard }
      expect(scorecard).to receive(:scorecard)
      subject.scorecard(scorecard_class.new)
    end
 
  end
end
