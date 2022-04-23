require 'scoresheet'

describe Scoresheet do
  let(:scoresheet) { described_class.new }

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

  it 'Should end the game by returning total score after the tenth frame has ended' do
    9.times do 
      scoresheet.current_frame.add_roll(10)
    end
    scoresheet.current_frame.add_roll(2)
    expect(scoresheet).to receive(:total_score)
    scoresheet.current_frame.add_roll(2)
  end
end
