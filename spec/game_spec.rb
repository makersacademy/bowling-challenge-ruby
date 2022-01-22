require 'game'

describe Game do
  it 'initializes a game without any frames' do 
    expect(subject.frames.to_s.length).to eq 0
  end

  describe '.add_frame' do 
    it 'creates a new frame' do 
      subject.add_frame
      expect(subject.frames.to_s.length).to eq 1
    end 
  end
end
    