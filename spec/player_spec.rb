require 'player'

describe Player do
  describe '#scores' do
    it 'has a scores array' do
      expect(subject.scores).to eq([])
    end
  end

  describe '#sum' do
    xit 'starts with a sum of 0' do
      expect(subject.sum).to eq(0)
    end

    it 'returns the correct sum after two rolls of frame 1' do
      subject.scores.push([3, 4])
      expect(subject.sum).to eq(7)
    end
  end

  describe '#add' do
    it 'adds a score to the score array' do
      @score = 5
      subject.add(@score)
      expect(subject.scores).to eq([[5]])
    end
    it 'adds both scores of a frame to the score array' do
      subject.add(5)
      subject.add(4)
      expect(subject.scores).to eq([[5, 4]])
    end
    it 'adds a third score in a new array' do
      subject.add(5)
      subject.add(4)
      subject.add(6)
      expect(subject.scores).to eq([[5, 4],[6]])
    end

    context 'scoring of spares' do
      it 'adds the score of the next roll to the spare' do
        subject.add(5)
        subject.add(5)
        subject.add(6)
        expect(subject.scores).to eq([[5,11],[6]])
      end
    end

    context 'ending the game' do
      it 'while not getting spares or strikes, will not let you add a score after frame 10 is finished' do
        20.times {subject.add(3)}
        subject.add(3)
        expect(subject.add(3)).to eq("The game has finished")
      end

      it 'after a strike or spare in frame 10, will not let you add a score after frame 10 is finished' do
        19.times {subject.add(3)}
        subject.add(10)
        subject.add(3)

        expect(subject.add(3)).to eq("The game has finished")
      end
    end
  end

  context 'strikes' do
    it 'skips the next roll of the frame' do
    subject.add(10)
    expect(subject.scores).to eq([[10, 0]])
    end
  end

end
