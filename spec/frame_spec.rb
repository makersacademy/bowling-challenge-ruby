require 'frame'

describe Frame do
  subject { Frame.new }
  describe 'a frame' do
    it 'responds to roll' do
      expect(subject).to respond_to(:roll1)
    end
    it 'roll returns a number between 1 and 10' do
      expect(subject.roll1).to be_between(0,10)
    end
    it "allows a player to roll twice if they don't get a strike on the first roll" do
      allow(subject).to receive(:spare) {false}
      allow(subject).to receive(:roll1) {1}
      allow(subject).to receive(:roll2) {1}
      expect(subject).to receive(:roll1)
      expect(subject).to receive(:roll2)
      subject.frame_start
    end
    it "doesn't allow a score = 10 for the second roll if the first roll has been <10" do
      srand(1)
      expect(subject.roll2(rand(10))).to be_between(0,5)
    end
  end
end
