require 'scorecard'

describe ScoreCard do 

  context 'frame class objects are correctly added to the score array' do 

    it ' adds a frame to the array ' do 

      scorecard = ScoreCard.new
      frame = Frame.new(5,3)
      scorecard.add(frame)
      expected_scorecard = 
        {roll_one: 5, roll_two: 3, frame_total: 8, is_strike?: false, is_spare?: false, bonus_status:false}
      expect(scorecard.total).to include (expected_scorecard)
    end 

  end 
  describe "total" do
     it "corectly calculate a spare in the first frame" do 
      scorecard = ScoreCard.new
      frame1 = Frame.new(6,4) 
      expect(frame1.bonus_status). to eq true
      frame2 = Frame.new(5,2) 
      scorecard.add(frame1)
      scorecard.add(frame2)
      scorecard.calculate_bonuses
      expect(frame1.is_spare?).to eq true
      expect(frame2.roll_one).to eq 5
      expected_frame1 = {roll_one: 6, roll_two: 4, frame_total: 15, is_strike?: false, is_spare?: true, bonus_status: false}        
      expected_frame2 = {roll_one: 5, roll_two: 2, frame_total: 7, is_strike?: false, is_spare?: false, bonus_status: false} 
      expect(scorecard.total).to include(expected_frame1)
      expect(scorecard.total).to include(expected_frame2)
    end   
  end    
end 