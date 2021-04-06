require 'frame'

describe Frame do
  subject { Frame.new }
  describe 'a frame' do
    it 'responds to roll' do
      expect(subject).to respond_to(:roll1)
    end
    it 'roll1 returns a number between 1 and 10' do
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
    it 'returns true if the player rolls a strike' do
      expect(subject.strike(10)).to eq true
    end
    it 'returns true if the player rolls a spare' do
      subject.instance_variable_set(:@roll1, 2)
      subject.instance_variable_set(:@roll2, 8)
      expect(subject.spare).to eq true
    end
    it 'returns [10,nil,2] if the player rolls a strike in frames 1-9' do
      allow(subject).to receive(:roll1) {10}
      expect(subject.frame_start).to eq [10, nil, 2]
    end
    it 'sets the bonus to 1 if the player rolls a spare in frames 1-9' do
      allow(subject).to receive(:roll1) {8}
      allow(subject).to receive(:roll2) {2}
      subject.frame_start
      expect(subject.instance_variable_get(:@bonus)).to eql(1)
    end
    it 'sets the total rolls to 3 if the first roll is a strike in frame 10' do
      allow(subject).to receive(:roll1) {10}
      subject.frame_10_start
      expect(subject.instance_variable_get(:@total_rolls)).to eql(3)
    end
    it 'sets the total rolls to 3 if the first two rolls are a spare in frame 10' do
      allow(subject).to receive(:roll1) {8}
      allow(subject).to receive(:roll2) {2}
      subject.frame_10_start
      expect(subject.instance_variable_get(:@total_rolls)).to eql(3)
    end
  end
end
