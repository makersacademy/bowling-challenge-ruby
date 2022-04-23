require 'scoresheet'

describe Scoresheet do
  let(:frame) { Frame.new }
  let(:scoresheet) { described_class.new(frame) }

  it 'Should create a new frame once there are 2 rolls in a frame' do
    scoresheet.current_frame.add_roll(5)
    scoresheet.current_frame.add_roll(2)
    expect(scoresheet).to receive(:new_frame)
    scoresheet.current_frame.add_roll(2)
  end

  it 'Should create a new frame if there are no pins left before the second roll' do
    scoresheet.current_frame.add_roll(10)
    expect(scoresheet).to receive(:new_frame)
    scoresheet.current_frame.add_roll(2)
  end

  it 'Should be able to get a total score after the tenth frame has ended' do
    20.times do 
      scoresheet.current_frame.add_roll(0)
    end
    expect(scoresheet.total_score).to eq(0)
  end

  describe '#frame_score' do
    it 'Should calculate the score of a frame' do
      scoresheet.current_frame.add_roll(6)
      scoresheet.current_frame.add_roll(2)
      expect(scoresheet.frame_score(frame)).to eq(8)
    end
  end

  describe '#strike_bonus' do
    it 'Should add the value of the next two rolls as a bonus after rolling a strike' do
      scoresheet.current_frame.add_roll(10)
      scoresheet.current_frame.add_roll(6)
      scoresheet.current_frame.add_roll(2)
      expect(scoresheet.frame_score(frame)).to eq(18)
    end
  end

  describe '#spare_bonus' do
    it 'Should add the value of the next roll as a bonus after rolling a spare' do
      scoresheet.current_frame.add_roll(10)
      scoresheet.current_frame.add_roll(6)
      scoresheet.current_frame.add_roll(2)
      expect(scoresheet.frame_score(frame)).to eq(16)
    end
  end
end
