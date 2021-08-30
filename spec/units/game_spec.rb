require 'game' 

describe Game do 
  it 'tracks the game score' do
    expect(subject.score).to eq 0
  end

  it 'tracks staret with frame' do
    expect(subject.frames.length).to eq 1
  end

  it 'tracks frames up to 10' do
    expect(subject.frames.length).to be <= 10
  end

  it 'tracks frame scores' do
    expect(subject.frame_scores).to eq []
  end

  describe '#roll' do
    it 'takes the number of pins the user knocked down' do
      expect(subject).to respond_to(:roll).with(1).argument
    end
  end

  describe '#check_frameover' do
    context '0 rolls remaining' do
      it 'adds the frame score to the game' do
        subject.roll(10)
        subject.roll(10)
        expect(subject.score).to eq 0
        subject.roll(10)
        expect(subject.score).to eq 30
      end

      it 'updates the frame status to closed' do
        subject.roll(1)
        subject.roll(0)
        expect(subject.frames.first.closed).to eq true
      end
    end

    it 'adds a frame score only once' do
      subject.roll(1)
      subject.roll(0)
      subject.roll(0)
      subject.roll(0)
      expect(subject.score).to eq 1
    end
  end

  describe '#gameover?' do
    it 'returns if game is over' do
      expect(subject.gameover?).to eq false
    end
  end

  describe '#add_frame' do
    context 'fewer than 10 frames in the game' do
      it 'adds a new frame' do
        8.times { subject.add_frame }
        expect{ subject.add_frame }.to change{ subject.frames.length }
      end
    end

    context '10 frames in the game' do
      it 'does not add a frame' do
        10.times { subject.add_frame }
        expect{ subject.add_frame }.not_to change{ subject.frames.length }
      end
    end
  end
end
