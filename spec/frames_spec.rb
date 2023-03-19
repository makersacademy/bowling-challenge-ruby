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

  xit '.' do
  end
end