describe Scorecard do 
  
  describe "#total" do 

    it "returns a sum of a single frame" do 
      frame = Frame.new([5,4])
      scorecard = Scorecard.new([frame])
      expect(scorecard.total).to eq(9)
    end 


  end
  
end 


