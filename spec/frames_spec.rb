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

  #it "Returns the bonus for a specific frame and the accumulated total." do
    #frame1 = Frames.new
    #frame1.roll_1(3)
    #frame1.roll_2(7) # player has a spare
    #frame2 = Frames.new
    #frame2.roll_1(8)
    #frame2.roll_2(2)
    #expect(frame1.bonus(frame1)).to eq 8
    #expect(frame1.accumulated_score).to eq 18
  #end
end