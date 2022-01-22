require 'frame'

describe Frame do
  it 'takes two rolls input to form a score for the frame' do
    frame = Frame.new(4, 5)
    expect(frame.total_points).to eq 9
  end
end