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
        expect(frame[:status]).to be_empty
        expect(frame[:rolls]).to be_empty
        expect(frame[:bonus]).to be_empty
      end
    end
  end

  describe ".run method" do
    it "should give the index number incremented by one to the first hash" do
      allow(kernel).to receive(:gets).at_least(1).times { "5" }
      subject.run
      result = subject.score_card[0]
      expect(result[:number]).to eq 1
    end

    context "valid inputs" do
      it "should be between 0 and 10 - test 1" do
        expect(kernel).to receive(:gets).once { "11" }
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls]).not_to eq [11]
        expect(result[:rolls]).to eq [10]
      end
      it "should be between 0 and 10 - test 2" do
        expect(kernel).to receive(:gets).once { "11" }
        expect(kernel).to receive(:gets).at_least(2).times { "4" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls]).not_to eq [11]
        expect(result[:rolls]).to eq [4,4]
      end
      it "should not be more than 10 after two rolls - test 1" do
        expect(kernel).to receive(:gets).once { "5" }
        expect(kernel).to receive(:gets).once { "6" }
        expect(kernel).to receive(:gets).at_least(1).times { "4" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls]).not_to eq [5,6]
        expect(result[:rolls]).to eq [5,4]
      end
      it "should not be more than 10 after two rolls - test 2" do
        expect(kernel).to receive(:gets).once { "11" }
        expect(kernel).to receive(:gets).once { "6" }
        expect(kernel).to receive(:gets).once { "7" }
        expect(kernel).to receive(:gets).at_least(1).times { "4" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls]).not_to eq [5,6]
        expect(result[:rolls]).to eq [6,4]
      end
    end


    context "first frame" do
      it "should prompt the user for two inputs per frame" do
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
      it "should save both rolls into the :rolls key" do
        expect(kernel).to receive(:gets) { "6" }
        expect(kernel).to receive(:gets).at_least(1).times { "3" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls]).to eq [6, 3]
      end
    end

    context "SPARE behaviour" do
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
        result = subject.score_card[0]
        expect(result[:rolls].length).to eq 2
      end
      it "should include points of the next roll in ':bonus' - test 1" do
        expect(kernel).to receive(:gets) { "5" }
        expect(kernel).to receive(:gets) { "5" }
        expect(kernel).to receive(:gets) { "7" }
        expect(kernel).to receive(:gets).at_least(1).times { "3" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "SPARE"
        expect(result[:rolls]).to eq [5,5]
        expect(result[:bonus]).to eq [7]
      end
      it "should include points of the next roll in in ':bonus' - test 2" do
        expect(kernel).to receive(:gets) { "4" }
        expect(kernel).to receive(:gets) { "6" }
        expect(kernel).to receive(:gets) { "2" }
        expect(kernel).to receive(:gets).at_least(1).times { "2" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "SPARE"
        expect(result[:rolls]).to eq [4,6]
        expect(result[:bonus]).to eq [2]
      end
      it "should include points of the next roll in in ':bonus' - test 3" do
        expect(kernel).to receive(:gets) { "9" }
        expect(kernel).to receive(:gets) { "1" }
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets).at_least(1).times { "3" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "SPARE"
        expect(result[:rolls]).to eq [9,1]
        expect(result[:bonus]).to eq [10]
      end
      it "should not have more than one bonus" do
        expect(kernel).to receive(:gets) { "9" }
        expect(kernel).to receive(:gets) { "1" }
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets).at_least(1).times { "3" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "SPARE"
        expect(result[:rolls]).to eq [9,1]
        expect(result[:bonus].length).to eq 1
      end
    end

    context "STRIKE behaviour" do
      it "should set :status to STRIKE" do
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "STRIKE"
        expect(result[:rolls]).to eq [10]
      end
      it "should jump to the next frame after a strike was rolled" do
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[0]
        expect(result[:rolls].length).to eq 1
      end
      it "should include points of the two next rolls in ':bonus' - test 1" do
        expect(kernel).to receive(:gets).exactly(1).times { "10" }
        expect(kernel).to receive(:gets).exactly(1).times { "5" }
        expect(kernel).to receive(:gets).at_least(1).times { "4" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "STRIKE"
        expect(result[:rolls]).to eq [10]
        expect(result[:bonus]).to eq [5,4]
      end
      it "should include points of the two next rolls in ':bonus' - test 2" do
        expect(kernel).to receive(:gets).exactly(1).times { "10" }
        expect(kernel).to receive(:gets).exactly(1).times { "0" }
        expect(kernel).to receive(:gets).at_least(1).times { "0" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "STRIKE"
        expect(result[:rolls]).to eq [10]
        expect(result[:bonus]).to eq [0,0]
      end
      it "should include points of the two next rolls in ':bonus' - test 3" do
        expect(kernel).to receive(:gets).exactly(1).times { "10" }
        expect(kernel).to receive(:gets).exactly(1).times { "10" }
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "STRIKE"
        expect(result[:rolls]).to eq [10]
        expect(result[:bonus]).to eq [10,10]
      end
      it "should not have more than two bonuses" do
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets) { "10" }
        expect(kernel).to receive(:gets).at_least(1).times { "10" }
        subject.run
        result = subject.score_card[0]
        expect(result[:status]).to eq "STRIKE"
        expect(result[:rolls]).to eq [10]
        expect(result[:bonus].length).to eq 2
      end
    end
  end
end

