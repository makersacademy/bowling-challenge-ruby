require "bowling"

describe Bowling do
  describe "#run" do
    it "runs a match" do
      allow(subject).to receive(:gets).and_return(1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6)
      expect(subject.score).to eq 119
    end
  end
end
