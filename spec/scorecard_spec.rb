require 'scorecard'
describe Scorecard do
  it "should be initialized with total_score, score_hash, current_frame and remaining_pins" do
    expect do
      subject.total_score
      subject.score_hash
      subject.current_frame
      subject.remaining_pins
    end.not_to raise_error
  end

  describe "#add_score" do
    before(:each) do
      @score = 5
    end

    it "should respond to a method called add_score" do
      expect{subject.add_score(@score)}.not_to raise_error
    end

    it "should add the score to the score hash" do
      scorecard = Scorecard.new
      scorecard.add_score(@score)
      first_frame = 1

      expect(scorecard.score_hash[first_frame]).to eq([5])
    end

  end

  it "should have a method called calculate_score" do
    expect{subject.calculate_score}.not_to raise_error
  end

  describe "score for strike" do

    before (:each) do
      @scorecard = Scorecard.new

      @scorecard.add_score(10)
    end
    
    it "should add a score of 10 to total_score" do
      expect(@scorecard.total_score).to eq(10)
    end

    it "should advance to the next frame" do
      expect(@scorecard.current_frame).to eq(2)
    end 
  end

  describe "score for a spare" do
    before (:each) do
      @score = 5
      @scorecard = Scorecard.new
      @scorecard.add_score(@score)
    end

    it "should not skip to the next frame if the first roll is less than 10" do
      expect(@scorecard.current_frame).to eq(1)
    end

    it "should have 5 remaining pins if the user scores 5 on his first roll" do
      expect(@scorecard.remaining_pins).to eq(5)
    end

    # DRY: extracted second roll here so don't need to repeat
    before (:each) do
      @scorecard.add_score(@score)
    end

    it "should add the second rolls score to the same frame in @score_hash" do
      first_frame = 1
      expect(@scorecard.score_hash[first_frame]).to eq([5, 5])
    end

    it "should add the scores of both rolls to the total_score" do
      expect(@scorecard.total_score).to eq(10)
    end

    it "should move to the next frame once two rolls have been completed" do
      expect(@scorecard.current_frame).to eq(2)
    end
  end
end 