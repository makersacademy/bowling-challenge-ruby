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

  context 'understands strikes' do
      
    it 'increases frame number on strike' do
      subject.roll(10)
      expect(subject.current_frame).to eq 2
    end

    it 'can correctly increase frame count for multiple strikes' do
      subject.roll(10)
      subject.roll(10)
      expect(subject.current_frame).to eq 3
    end

    it 'can work out if a previous frame was a strike' do
      subject.roll(2)
      subject.roll(8)
      subject.roll(10)
      frame_number = 2
      expect(subject.strike?(frame_number)).to eq true
    end

    it "can work out if a previous frame wasn't a strike" do
      subject.roll(2)
      subject.roll(8)
      subject.roll(10)
      frame_number = 1
      expect(subject.strike?(frame_number)).to eq false
    end
  end

  context 'understands spares' do
    
    it 'can workout if a previous frame was a spare' do
      subject.roll(2)
      subject.roll(8)
      subject.roll(10)
      frame_number = 1
      expect(subject.spare?(frame_number)).to eq true
    end

    it "can workout if a previous frame wasn't a spare" do
      subject.roll(2)
      subject.roll(8)
      subject.roll(10)
      frame_number = 2
      expect(subject.spare?(frame_number)).to eq false
    end

    it "can workout if a previous frame wasn't a spare" do
      subject.roll(2)
      subject.roll(7)
      frame_number = 1
      expect(subject.spare?(frame_number)).to eq false
    end
  end

  it 'can correctly calculate the score for a spare' do
    subject.roll(2)
    subject.roll(8)
    subject.roll(3)
    subject.score
    expect(subject.currentscore).to eq(16)
  end

  it 'can correctly calculate the score for a spare' do
    subject.roll(2)
    subject.roll(8)
    subject.roll(0)
    subject.score
    expect(subject.currentscore).to eq(10)
  end

  it 'can correctly calculate the score a strike' do
    subject.roll(10)
    subject.roll(10)
    subject.roll(6)
    subject.roll(2)
    subject.score
    expect(subject.currentscore).to eq(52)
  end

end
