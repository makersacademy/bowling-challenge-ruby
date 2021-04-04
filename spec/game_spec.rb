require 'game'
require 'frame'

describe Game do
  subject { Game.new }
  let(:score) {double 'score'}
  let(:frame) {double 'frame_class'}
  let(:frame_class) {double 'frame_class'}
  let(:frame_instance) {double 'frame_class.new'}

  describe 'play' do
    before do
      allow($stdin).to receive(:gets).
        and_return('quit')
      allow(subject).to receive(:quit).and_yield
    end
    describe "playing the game" do
      it 'receives frame and returns the frame number' do
        expect(subject).to receive(:frame).and_return('1')
        subject.frame
      end
      it 'receives roll and creates an instance of the Frame class' do
        subject.instance_variable_set(:@score, score)
        subject.instance_variable_set(:@frame_class, frame_class)
        allow(score).to receive(:calculate) {[1,1,1]}
        allow(frame_class).to receive(:new) {frame_instance}
        allow(frame_instance).to receive(:frame_start) {[1,1,1]}
        expect(frame_class).to receive(:new)
        subject.roll
      end
      it 'increments the frame with each roll' do
        subject.instance_variable_set(:@score, score)
        allow(score).to receive(:calculate) {[1,1,1]}
        expect { subject.roll }.to change { subject.frame }.by 1
      end
      it 'calls score when there has been a roll' do
        subject.instance_variable_set(:@score, score)
        allow(score).to receive(:calculate) {[1,1,1]}
        expect(score).to receive(:calculate)
        subject.roll
      end
      xit 'scores correctly with 10 strikes' do
        subject.instance_variable_set(:@score, score)
        subject.instance_variable_set(:@frame_class, frame_class)
        allow(score).to receive(:calculate) {[1,1,1]}
        allow(frame_class).to receive(:new) {frame_instance}
        allow(frame_instance).to receive(:frame_start) {[1,1,1]}
        expect(frame_class).to receive(:new)
        subject.roll
      end
    end
    xdescribe "playing the game" do
       it "a player enters 'frame' and the game returns 1" do
        allow($stdin).to receive(:gets).and_return('frame')
        allow($stdin).to receive(:gets).and_return('quit')
        allow(subject).to receive(:quit).and_yield
        expect { subject.play }.to output("What would you like to do?\n").to_stdout
        expect { subject.play }.to output("1\n").to_stdout
        subject.quit
      end
    end
  end
end
