require 'game'

describe Game do
  it {is_expected.to respond_to(:current_frame_obj)}
  it {is_expected.to respond_to(:all_frames)}
  it {is_expected.to respond_to(:current_frame_num)}
  it 'inits with no current frame' do
    expect(subject.current_frame_obj).to eq(nil)
  end
  
  it 'inits with an empty array of all frames' do
    expect(subject.all_frames).to eq([])
  end

  it 'inits with an empty array of all frames' do
    expect(subject.current_frame_num).to eq(1)
  end
  
end