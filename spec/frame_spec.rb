require 'frame'


RSpec.describe Frame do
  context "#getRolls" do
    it "getting 2 rolls to create a single frame" do
      score = Frame.new
      expect(score.getRolls).to eq [0, 0]
    end
  end

  context "#is_strike?" do
    it "checks whether first roll is not a strike" do
      score = Frame.new
      expect(score.is_strike?([1, 9])).to eq false
    end
    
    it "checks whether first roll is not a strike" do
      score = Frame.new
      expect(score.is_strike?([10, 0])).to eq true
    end
  end

  context "#is_spare?" do
    it "checks whether two rolls are not a spare" do
      score = Frame.new
      expect(score.is_spare?([1, 4])).to eq false
    end
    
    it "checks whether two rolls are a spare" do
      score = Frame.new
      expect(score.is_spare?([2, 8], 1)).to eq true
    end
  end



  context "#is_finished?" do
    it "checks roll index to evaluate if frame is finished" do
      score = Frame.new
      expect(score.is_finished?).to eq false
    end

    it "checks roll index to evaluate if frame is finished" do
      score = Frame.new
      expect(score.is_finished?(2)).to eq true
    end

    it " checks whether first roll is a strike" do
      score = Frame.new
      expect(score.is_finished?(0, [10, 0])).to eq true
    end

    it "checks whether the tenth frame is working" do
      score = Frame.new(true) #=> the tenth frame
      # if the player played 3 rolls
      # 0 -> 1st -> 1
      # 1 -> 2nd -> 2
      # 2 -> 3rd -> 3
      expect(score.is_finished?(2, [10, 10, 0])).to eq false
      expect(score.is_finished?(2, [6, 4, 0])).to eq false
      # the player can't play a strike or spare but he/she played 2 rolls
      expect(score.is_finished?(2, [5, 4, 0])).to eq true
      # finsihed
      expect(score.is_finished?(3, [10, 10, 10])).to eq true
      expect(score.is_finished?(3, [5, 5, 10])).to eq true
    end
  end

  context "#add(pins)" do
    it "add pins to index" do
      score = Frame.new
      # check if the roll_index = 0
      score.add(4)
      expect(score.getRolls).to eq [4, 0]
      # check if the roll_index = 1
      score.add(6)
      expect(score.getRolls).to eq [4, 6]
      # check if the roll_index = 2
      score.add(2)
      # it should remain unchanged
      expect(score.getRolls).to eq [4, 6]
    end
  end

  context "#roll_score" do
    it "adds together 2 rolls" do
      score = Frame.new
      score.add(2) #=> [2, 0]
      score.add(4) #=> [2, 4]
      expect(score.roll_score).to eq 6
    end
  end
end
