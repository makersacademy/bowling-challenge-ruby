require 'frames'
require 'roll'
require 'score_card'

describe Frames do
  let(:frames) { Frames.new }

  it 'frames calls end game after 10 frame_rounds' do
    score_card  = class_double"ScoreCard"
    expect(Object).to receive(:pins_knocked).and_return(4)
    9.times { frames.new_round }
    expect(frames.new_round).to be_an_instance_of(ScoreCard)
    frames.new_round
  end

  it 'new_round calls new_roll if frame_rounds < 11' do
    roll  = class_double"Roll"
    expect(Object).to receive(:pins_knocked).and_return(4)
    expect(frames.new_round).to be_an_instance_of(Roll)
    frames.new_round
  end
  
    
  it 'new_roll calls an instance of Roll with XXX' do
    roll  = class_double"Roll"
    expect(Object).to receive(:pins_knocked).and_return(4)
    expect(frames.new_round).to be_an_instance_of(Roll)
  end


end