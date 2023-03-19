require "scorecard"

describe ScoreCard do

  let(:kernel) { spy(double :Kernel) }
  let(:score_card) { spy(double :ScoreCard) }
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

  describe ".run method" do
    it "should give the index number incremented by one to the first hash" do
      allow(kernel).to receive(:gets) { "5" }
      allow(kernel).to receive(:gets) { "4" }
      subject.run
      result = subject.score_card[0]
      expect(result[:number]).to eq 1
    end

    # context "valid inputs" do
    #   it "should be between 0 and 10" do
    #     expect(kernel).to receive(:gets).at_least(1).times { "11" }
    #     result = subject.score_card[0]
    #     expect(result[:rolls]).to eq []
    #   end
    # end


    context "first frame" do
      it "should prompt the user for two inputs constituting the two rolls" do
        expect(kernel).to receive(:gets).at_least(2).times { "4" }
        subject.run
      end
      it "should save both rolls into the :rolls key" do
        expect(kernel).to receive(:gets) { "5" }
        expect(kernel).to receive(:gets).at_least(1).times { "4" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls]).to eq [5, 4]
      end
      it "should set :status to SPARE if the total of the two rolls is equal to 10" do
        expect(kernel).to receive(:gets) { "5" }
        expect(kernel).to receive(:gets).at_least(1).times { "5" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "SPARE"
        expect(result[:rolls]).to eq [5, 5]
      end
      it "should jump to the next frame after 2 rolls was played" do
        expect(kernel).to receive(:gets) { "5" }
        expect(kernel).to receive(:gets).at_least(1).times { "5" }
        subject.run
        result = subject.score_card[1]
        expect(result[:number]).to eq 2
      end
      it "should set :status to STRIKE and jump to next frame if input is 10 on roll 1" do
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "STRIKE"
        expect(result[:rolls]).to eq [10]
      end
      it "should jump to the next frame after a strike was rolled" do
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[1]
        expect(subject.score_card[1][:number]).to eq 2
      end
    end
  end
end

