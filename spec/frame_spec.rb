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
end