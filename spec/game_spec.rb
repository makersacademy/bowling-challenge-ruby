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

  describe 'score' do
   it 'knows the current game score' do
      subject.add_frame(8)

      expect(subject.score).to eq 8
    end
    it 'knows the current game score' do
      subject.add_frame(8)
      subject.add_frame(1)
      subject.add_frame(3)
      subject.add_frame(3)

      expect(subject.score).to eq 15
    end 
  end
end