require 'frame'

describe Frame do
  describe "initialize" do
    it 'has 10 pins' do
      expect(subject.pins).to eq 10
    end

    it 'has a score of 0' do
      expect(subject.score).to eq 0
    end

    it 'is on roll 1' do
      expect(subject.roll).to eq 1
    end

    it 'has a false strike attribute' do
      expect(subject.strike).to eq false
    end

    it 'has a false spare attribute' do
      expect(subject.spare).to eq false
    end
  end

  describe "score" do
    it "updates by pins cleared if not strike/spare" do
      subject.roll_ball(6)
      subject.next_roll
      subject.roll_ball(2)
      expect(subject.score).to eq 8
    end
  end

  describe "strike" do
    it 'returns true if pins are cleared in roll 1' do
      subject.roll_ball(10)
      expect(subject.strike?).to eq true
    end
  end

  describe "spare" do
    it 'returns true if pins are cleared in roll 2' do
      subject.roll_ball(6)
      subject.next_roll
      subject.roll_ball(4)
      expect(subject.spare?).to eq true
    end
  end
end