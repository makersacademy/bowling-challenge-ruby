require 'frame'

describe Frame do

  let(:new_frame) { described_class.new }

  describe '#initialise' do
    it 'initializes with empty game array' do
      expect(new_frame.rolls).to eq []
    end
  end

  describe '#add_score' do
    it 'adds 1 roll to rolls array' do
      new_frame.add_score(9)
      expect(new_frame.rolls.length).to eq 1
    end

    it 'returns current score for the frame' do
      new_frame.add_score(5)
      expect(new_frame.rolls.sum).to eq 5
    end

    it 'adds 2 rolls to rolls array' do
      new_frame.add_score(3)
      new_frame.add_score(4)
      expect(new_frame.rolls.length).to eq 2
    end

    it 'returns current score for two rolls' do
      new_frame.add_score(5)
      new_frame.add_score(4)
      expect(new_frame.rolls.sum).to eq 9
    end
  end


  describe '#calc_frame_total' do
    it 'calculates score for the frame' do
      new_frame.add_score(5)
      new_frame.add_score(4)
      expect(new_frame.calc_frame_total).to eq 9
    end
  end

  describe '#calc_frame_total' do
  it 'calculates score for the frame' do
    new_frame.add_score(5)
    new_frame.add_score(4)
    new_frame.set_frame_total
    expect(new_frame.frame_total).to eq 9
  end
end




  
end