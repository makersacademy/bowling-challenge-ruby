require 'frame'

describe Frame do

  it 'saves users rolls' do
    frame = Frame.new
    allow(frame).to receive(:first_roll).and_return(2)
    allow(frame).to receive(:second_roll).and_return(4)
    frame.run_frame
    expect(frame.rolls).to include 2
    expect(frame.rolls).to include 4
  end

  it 'allows third role on final frame' do
    frame = Frame.new
    frame.final_frame = true
    allow(frame).to receive(:first_roll).and_return(6)
    allow(frame).to receive(:second_roll).and_return(4)
    allow(frame).to receive(:third_roll).and_return(8)
    frame.run_frame
    expect(frame.rolls).to include 6
    expect(frame.rolls).to include 4
    expect(frame.rolls).to include 8
  end

end
