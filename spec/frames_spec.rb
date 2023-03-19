require './lib/frames'

RSpec.describe Frames do
  it 'Returns current frame number.' do
    frame = Frames.new
    frame.increment_frame
    frame.increment_frame
    frame.increment_frame
    current = frame.current_frame
    expect(current).to eq 3
  end

  it 'Returns the score for roll 1.' do
    frame = Frames.new
    frame.roll_1(3)
    expect(frame.roll_1(3)).to eq 3
  end
end