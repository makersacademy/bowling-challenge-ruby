require 'game'

describe Game do
  it {is_expected.to respond_to(:current_frame)}
  it {is_expected.to respond_to(:all_frames)}
  it 'inits with no current frame' do
    expect(subject.current_frame).to eq(nil)
  end
  
  it 'inits with an empty array of all frames' do
    expect(subject.all_frames).to eq([])
  end

end