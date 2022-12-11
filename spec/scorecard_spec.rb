require 'scorecard'

describe ScoreCard do 

  context 'frame class objects are correctly added to the score array' do 

    it ' adds a frame to the array ' do 

      scorecard = ScoreCard.new
      frame = Frame.new(5,3)
      scorecard.add(frame)
      expected_scorecard = 
        {roll_one: 5, roll_two: 3, frame_total: 8, is_strike?: false, is_spare?: false}
      
      expect(scorecard.total).to include (expected_scorecard)

    end 

  end 
  describe "total" do
     xit "corectly calculate a spare in the first frame" do 
      scorecard = ScoreCard.new
      frame1 = Frame.new(6,4) 
      frame1_total = frame1.frame_total
      frame2 = Frame.new(5,2) 
      frame2_total = frame2.frame_total
      scorecard.add(frame1_total)
      scorecard.add(frame2_total)

      expected_scorecard = [
      {frame_one: 15},
      {frame_two: 7},
      ]
      expect(scorecard.total).to include(expected_scorecard)
      expect(frame1.is_spare?).to eq true
    end   
  end    
end 