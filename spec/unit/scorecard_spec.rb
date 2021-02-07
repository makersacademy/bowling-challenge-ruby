require "scorecard"

describe Scorecard do
  
  describe ".create" do
    it "should create a new scorecard" do
      expect(Scorecard.create).to be_a Scorecard
    end
  end

end