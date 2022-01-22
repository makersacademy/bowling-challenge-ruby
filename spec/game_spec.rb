require 'game'

describe Game do
  let(:frame1) { [1, 4] }

  it 'initializes a game without any frames' do 
    expect(subject.frames.length).to eq 0
  end

  describe '.add_frame' do 
    it 'creates a new frame' do 
      subject.add_frame(frame1)
      expect(subject.frames.length).to eq 1
    end 

    it 'detects a spare or strike' do 
    end 

  end
end
    