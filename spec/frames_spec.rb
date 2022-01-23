require 'frames'
require 'roll'

describe Frames do
  let(:frames) { Frames.new }
  
 

  it 'frames calls end game after 10 frame_rounds' do
    roll  = class_double"ScoreCard"
    expect(Frames.new_round(round: 10, score_count: 0, strike_count: 0, bonus: nil)).to be_an_instance_of(ScoreCard)
  end
  
    
  it 'new_roll calls an instance of Roll with XXX' do
    roll  = class_double"Roll"
    expect(Frames.new_round(round: 0, score_count: 0, strike_count: 0, bonus: nil)).to be_an_instance_of(Roll)
  end

end