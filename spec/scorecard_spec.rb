describe Scorecard do 
  
  describe "#total" do 

    it "returns a sum of two rolls" do 
      frame = Frame.new([[5,4]], false, false)
      scorecard = Scorecard.new(frame)
      expect(scorecard.total).to eq(9)
    end 

    it "returns sum of many frames" do 
      frame = Frame.new([[3,4], [6,3], [2,1]], false, false)
      scorecard = Scorecard.new(frame)
      expect(scorecard.total).to eq(19)
    end 

    it "can calculate bonus's when spare is scored" do 
      frame = Frame.new([[3,4], [6,4], [5,0]], true, false)
      scorecard = Scorecard.new(frame)
      expect(scorecard.total).to eq(27)
    end 

    # it "can calculaye bonus's when strike is scored" do 
    #   scorecard = Scorecard.new([[3,4], [10,0], [5,2]])
    #   expect(scorecard.total).to eq(31)
    # end 
  end
  
end 


