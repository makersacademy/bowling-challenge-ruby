require 'frame'

describe Frame do

  let(:new_frame) { described_class.new }

  describe '#initialise' do
    it 'initializes with empty game array' do
      expect(new_frame.no_of_rolls).to eq 0
    end
  end

  describe '#add_roll' do
    it 'adds 1 to number of rolls' do
      new_frame.add_roll
      expect(new_frame.no_of_rolls).to eq 1
    end
  end

  describe '#add_roll_2_score' do
  it 'add score to roll_2_score' do
    new_frame.add_roll_1_score(5)
    expect(new_frame.roll_1_score).to eq 5
  end
end

  describe '#add_roll_1_score' do
    it 'add score to roll_1_score' do
      new_frame.add_roll_1_score(10)
      expect(new_frame.roll_1_score).to eq 10
    end
  end

  describe '#calc_frame_total' do
    it 'calculates score for the frame' do
      new_frame.add_roll_1_score(5)
      new_frame.add_roll_2_score(7)
      expect(new_frame.calc_frame_total).to eq 12
    end
  end

  describe '#calc_frame_total' do
  it 'calculates score for the frame' do
    new_frame.add_roll_1_score(5)
    new_frame.add_roll_2_score(7)
    new_frame.set_frame_total
    expect(new_frame.frame_total).to eq 12
  end
end




  
end