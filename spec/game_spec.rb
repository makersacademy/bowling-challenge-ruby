require 'game'

describe Game do
  it 'has a max of ten frames' do
    expect(subject.total_frames).to eq 10
  end

  it 'knows the score of all played frames' do
    frame_one = instance_double('Frame', :score => 8)
    subject.add_frame(frame_one.score)

    expect(subject.frames).to include 8
  end
end