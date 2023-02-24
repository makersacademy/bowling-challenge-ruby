require_relative '../lib/frame'

describe Frame do
  it 'Can handle a single roll' do
    frame = Frame.new
    frame.add_roll(5)
    expect(frame.score).to eq(5)
  end
  
  it 'Can handle two rolls' do
    frame = Frame.new
    frame.add_roll(5)
    frame.add_roll(3)
    expect(frame.score).to eq(8)
  end

end  