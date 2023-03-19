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
    expect(frame.roll_1(3)).to eq 3
  end

  it 'Raises error when roll 1 input is incorrect.' do
    frame = Frames.new
    expect { frame.roll_1(12) }.to raise_error "Roll input is incorrect! It must be a value between 0 and 10 (inclusive)"
  end

  it 'Raises error when roll 2 input is incorrect.' do
    frame = Frames.new
    expect { frame.roll_2(-7) }.to raise_error "Roll input is incorrect! It must be a value between 0 and 10 (inclusive)"
  end
end