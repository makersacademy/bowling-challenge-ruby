describe Scorecard do 
  
  describe "#roll" do 

    it "returns a sum of two rolls" do 
      frame = [4,5]
      scorecard = Scorecard.new(frame)
      expect(scorecard.total).to eq(9)
    end 


  end
  
end 


