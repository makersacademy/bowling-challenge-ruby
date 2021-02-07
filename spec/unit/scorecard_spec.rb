describe Scorecard do
  
  describe ".create" do
    it "should create a new scorecard" do
      expect(Scorecard.create).to be_a Scorecard
    end
  end

  describe ".score" do
    it "should have one argument" do
      expect(Scorecard).to respond_to(:score).with(1).argument
    end
  end

end