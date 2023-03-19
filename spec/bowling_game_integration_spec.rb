require 'score_card'
require 'frame'

RSpec.describe 'integeration' do 
  xit "adds a frame to the scorecard" do 
    score = ScoreCard.new
    frame_1 = Frame.new
    frame_1.roll(3,4)

    score.add(frame_1)
    expect(score.total).to eq 7
  end 

  xit  "adds multiple frames to the scorecard" do 
    score = Scorecard.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    frame_1.roll(3,4)
    frame_2.roll(1,3)

    score.add(frame_1)
    score.add(frame_2)
    expect(score.total).to eq 11
  end 

  xit "adds a strike to the scorecard" do 
    score = Scorecard.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    frame_1.roll(10)
    frame_2.roll(1,3)

    score.add(frame_1)
    expect(score.total).to eq 14
  end 

  xit "adds multiple scores including a spare to the scorecard" do 
    score = Scorecard.new
    frame_1 = Frame.new
    frame_2 = Frame.new
    frame_1.roll(3,7)
    frame_2.roll(1,7)

    score.add(frame_1)
    score.add(frame_2)
    expect(score.total).to eq 19
  end 


  xit "returns error if score total requested but full number of rolls required have not been played" do  
    score = Scorecard.new
    frame_1 = Frame.new
    frame_1.roll(10)

    expect { score.add(frame_1) }.to raise_error "strike requires two more rolls for your bonus"
  end 

end  