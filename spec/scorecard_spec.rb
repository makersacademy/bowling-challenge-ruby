describe Scorecard do 
  
  describe "#total" do 

    it "returns a sum of a single frame" do 
      frame = Frame.new([5,4])
      scorecard = Scorecard.new([frame])
      expect(scorecard.total).to eq(9)
    end 

    it "returns the sum of frames with no spares or strikes" do 
      frames = [Frame.new([3,4]), Frame.new([5,4]), Frame.new([2,3])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(21)
    end

    it "returns the sum of frames with a spare" do 
      frames = [Frame.new([3,4]), Frame.new([6,4]), Frame.new([2,3])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(24)
    end

    it "returns the sum of frames with a spare on the end" do 
      frames = [Frame.new([3,4]), Frame.new([5,4]), Frame.new([7,3])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(26)
    end


  end
  
end 


