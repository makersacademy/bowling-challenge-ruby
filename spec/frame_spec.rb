require 'frame'

describe Frame do
  it 'takes two rolls input to form a score for the frame' do
    frame = Frame.new(4, 5)
    expect(frame.points).to eq 9
  end

  it 'recognises a strike' do
    frame = Frame.new(10, 0)
    expect(frame.strike?).to eq true
  end

  it 'recognises a spare' do
    frame = Frame.new(3, 7)
    frame_2 = Frame.new(9, 1)

    expect(frame.spare?).to eq true
    expect(frame_2.spare?).to eq true
  end
end