require 'frame' 

describe Frame do
  it 'starts open' do
    expect(subject.finished).to eq false
  end
end
