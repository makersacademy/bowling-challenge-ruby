require 'game'
describe Game do
  
  it 'starts with a score of 0' do
    expect(subject.currentscore).to eq 0
  end

  context 'allows the player to enter the number of pins knocked down' do
    
    it 'scores the first ball' do
      subject.roll(8)
      subject.score
      expect(subject.currentscore).to eq 8
    end

    it 'scores the second ball' do
      subject.roll(3)
      subject.roll(5)
      subject.score
      expect(subject.currentscore).to eq 8
    end

    it 'stores the current frame' do
      subject.roll(3)
      subject.roll(5)
      expect(subject.frames.length).to eq 1
    end
  end

end
