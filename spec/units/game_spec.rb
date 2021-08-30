require 'game' 

describe Game do 
  it 'tracks the game score' do
    expect(subject.score).to eq 0
  end

  it 'starts with first frame' do
    expect(subject.frames.length).to eq 1
  end

  it 'tracks frames up to 10' do
    expect(subject.frames.length).to be <= 10
  end

  it 'tracks frame scores' do
    expect(subject.frame_scores).to eq []
  end

  it 'ends after 10 frames' do
    9.times { subject.roll(10) }
    subject.roll(2)
    subject.roll(3)
    expect{ subject.roll(2) }.to raise_error.with_message("Game over. Final score: 252")
  end

  context '10th frame has bonus scoring' do
    it 'allows bonus rolls' do
      12.times { subject.roll(10) }
      expect(subject.score).to eq 300
    end
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

  describe '#add_frame' do
    context 'fewer than 10 frames in the game' do
      it 'adds a new frame' do
        8.times { subject.roll(10) }
        expect{ subject.roll(10) }.to change{ subject.frames.length }.by(+1)
      end
    end

    context '10 frames in the game' do
      it 'does not add a frame' do
        10.times { subject.roll(10) }
        expect{ subject.roll(10) }.not_to change{ subject.frames.length }
      end
    end

    context 'strike' do
      it 'adds a new frame' do
        expect{ subject.roll(10) }.to change{ subject.frames.length }.by(+1)
      end
    end

    context 'split' do
      it 'adds a new frame' do
        subject.roll(5)
        expect{ subject.roll(5) }.to change{ subject.frames.length }.by(+1)
      end
    end

    context 'second roll in frame without knocking all pins' do
      it 'adds a new frame' do
        subject.roll(0)
        expect{ subject.roll(0) }.to change{ subject.frames.length }.by(+1)
      end
    end
  end

  describe '#gameover?' do
    it 'returns if game is over' do
      expect(subject.gameover?).to eq false
    end
  end
end
