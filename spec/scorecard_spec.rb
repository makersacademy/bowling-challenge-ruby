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

    it "returns the sum of frames with a stirkes" do 
      frames = [Frame.new([3,4]), Frame.new([10,0]), Frame.new([7,2])]
      frames2 = [Frame.new([3,4]), Frame.new([4,0]), Frame.new([10,0])]
      scorecard = Scorecard.new(frames)
      scorecard2 = Scorecard.new(frames2)
      expect(scorecard.total).to eq(35)
      expect(scorecard2.total).to eq(21)
    end

    it "returns bonus scores for doubles" do 
      frames = [Frame.new([3,1]), Frame.new([10,0]), Frame.new([10,0]), Frame.new([5,0])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(49)
    end 

    it "returns bonus scores for turkey" do 
      frames = [Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,0]), Frame.new([5,0])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(75)
    end 

    it "can calucate 10 frames with spares" do 
      frames = [Frame.new([1,0]), Frame.new([1,0]), Frame.new([1,0]), Frame.new([1,0]), Frame.new([1,0]), 
      Frame.new([1,0]), Frame.new([1,0]), Frame.new([1,0]), Frame.new([4,6]), Frame.new([4,6,10])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(42)
    end 

    it "can calculate the perfect game" do 
      frames = [Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,0]), 
      Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,0]), Frame.new([10,10,10])]
      scorecard = Scorecard.new(frames)
      expect(scorecard.total).to eq(300)
    end 


  end
  
end 


