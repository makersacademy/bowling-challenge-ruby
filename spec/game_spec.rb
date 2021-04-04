require 'game'
require 'frame'
require 'score'

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
    describe "rolling a ball" do
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
      it 'receives roll and calls frame_10_start for frame 10' do
        subject.instance_variable_set(:@frame, 9)
        subject.instance_variable_set(:@score, score)
        subject.instance_variable_set(:@frame_class, frame_class)
        allow(score).to receive(:calculate_frame10) {[1,1,1]}
        allow(frame_class).to receive(:new) {frame_instance}
        allow(frame_instance).to receive(:frame_10_start) {[1,1,1]}
        expect(score).to receive(:calculate_frame10)
        subject.roll
      end
    end
    describe 'calculating the score' do
      it 'adds a bonus to the previous score on the next roll' do
        subject.instance_variable_set(:@game_score, Array.new(10, 0))
        subject.instance_variable_set(:@frame, 2)
        subject.store_score(10,5,5)
        expect(subject.instance_variable_get(:@game_score)).to eql([5,5,10,0,0,0,0,0,0,0])
      end
    end
    describe "playing the game" do
      it "a player is told they are starting the game" do
        expect { subject.start_message }.to output("Welcome to ten pin bowling.\nWhat would you like to do?\n").to_stdout
      end
    end
    describe "choosing an action" do
      it "Asks the user to input something else if their command isn't recognised" do
        allow(subject).to receive(:get_action) {"shhgh"}
        expect { subject.choose_action }.to output("Command not recognised. Try 'frame, roll or quit'\nWhat would you like to do?\n").to_stdout
      end
      it "calls roll if the user inputs roll" do
        allow(subject).to receive(:get_action) {"roll"}
        expect(subject).to receive(:roll)
        subject.choose_action
      end
      it 'receives frame and returns the frame number' do
        expect(subject).to receive(:frame).and_return('1')
        subject.frame
      end
      it 'returns the frame' do
        allow(subject).to receive(:get_action) {"frame"}
        expect { subject.choose_action }.to output("0\nWhat would you like to do?\n").to_stdout
        subject.choose_action
      end
      it 'calls start_message' do
        subject.instance_variable_set(:@frame, 10)
        allow(subject).to receive(:start_message) {"Message"}
        expect(subject).to receive(:start_message)
        subject.play
      end
    end
  end
end
