require 'frame'

describe Frame do

  it 'initialises @frame as a frame hash' do
    expect(Frame.new(1).frame).to eq ({frame: 1, 1 => nil, 2 => nil, spare: nil, strike: nil})
  end

  it 'provides for three rolls in tenth frame' do
    expect(Frame.new(10).frame).to eq ({frame: 10, 1 => nil, 2 => nil, 3 => nil, spare: nil, strike: nil})

  end

  it 'does not allow integers below 0 or integers above 10 as frame_id parameter' do
    message = 'Not a valid frame number'
    expect { Frame.new(11) }.to raise_error message
    expect { Frame.new(0) }.to raise_error message
  end

  it 'does not allow non-integers as frame number' do
    message = 'Not a valid frame number'
    expect { Frame.new(nil) }.to raise_error message
    expect { Frame.new('a') }.to raise_error message
  end

end
