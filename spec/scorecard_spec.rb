require "scorecard"

describe ScoreCard do

  let(:kernel) { spy(double :Kernel) }
  let(:subject) { described_class.new(kernel) }


  context ".intialize method" do
    it "should instanciate a new object" do
      expect(subject).to be
    end
    it "should initiate a list of frame hashes" do
      subject.score_card.each do |object|
        expect(object.class).to eq Hash
      end
    end
    it "should initiate a list of 10 frame hashes" do
      expect(subject.score_card.length).to eq 10
    end
    it "should initiate a list of 10 frame hashes" do
      expect(subject.score_card.length).to eq 10
    end
    it "should initially contain four keys with nil or empty values" do
      subject.score_card.each do |frame|
        expect(frame[:number]).to be_nil
        expect(frame[:status]).to be_nil
        expect(frame[:rolls]).to be_empty
        expect(frame[:bonus]).to be_empty
      end
    end
  end
end

