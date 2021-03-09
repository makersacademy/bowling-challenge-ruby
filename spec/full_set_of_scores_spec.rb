require 'full_set_of_scores'

describe Finished do

  describe 'totals' do
    it 'returns an array (for the total for each frame)' do
      expect(subject.totals).to be_a Array
    end
  end

  describe 'calculate' do
    it 'calculates the totals for each frame (no strikes/spares)' do
      subject.calculate([[2,4],[3,5]])
      expect(subject.totals).to eq [6,8]
    end

    it "sums a frame and a half for a spare" do
      subject.scores = [[6,4], [3,5]]
      subject.calculate
      expect(subject.totals).to eq [13,8]
    end

    it "sums two whole frames for 1 strike" do
      subject.scores = [[10], [4,3]]
      subject.calculate
      expect(subject.totals).to eq [17,7]
    end

    it 'calls strike method' do
      expect(subject).to receive(:strike)
      subject.calculate([[10], [4,3]])
    end

    it "sums 2.5 frames for 2 consecutive strikes" do
      subject.scores = [[10],[10],[6,3]]
      subject.calculate
      expect(subject.totals).to eq [26,19,9]
    end
  end

  describe 'strike' do
    it "sums two whole frames for 1 strike" do
      subject.scores = [[10], [4,3]]
      expect(subject.strike(0)).to eq 17
    end

    it 'sums 2.5 frames for 2 consecutive strikes' do
      subject.scores = [[10],[10],[4,6]]
      expect(subject.strike(0)).to eq 24
    end
  end

  describe 'get_frame' do
    it "gets input from user and puts it in scores array" do
      expect{ subject.get_frame }.to output.to_stdout
      expect{ subject.get_frame }.to change{ subject.scores }
    end
  end
end
