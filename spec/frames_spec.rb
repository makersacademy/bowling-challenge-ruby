require 'frames'
require 'roll'
require 'score_card'

describe Frames do
  let(:frames) { Frames.new }

  it 'frames calls end game after 10 frame_rounds' do
    score_card  = class_double"ScoreCard"
    allow_any_instance_of(Object).to receive(:gets).and_return("4\n")
    9.times { frames.new_round }
    expect(frames.new_round).to be_an_instance_of(ScoreCard)
    frames.new_round
  end

  # it 'new_round calls new_roll if frame_rounds < 11' do
  #   roll  = class_double"Roll"
  #   allow_any_instance_of(Object).to receive(:gets).and_return("4\n")
  #   expect(frames.new_round).to include_an_instance_of(Roll)
  #   frames.new_round
  # end
  

  describe '#pins_knocked' do
    it 'pins knocked runs and receives number of pins' do
      allow_any_instance_of(Object).to receive(:gets).and_return("4\n")
      expect(frames.pins_knocked).to eq 4
    end
  end

end