require 'player'

describe Player do
  describe '#scores' do
    it 'has a scores array' do
      expect(subject.scores).to eq([])
    end
  end

  describe '#sum' do
    it 'starts with a sum of 0' do
      expect(subject.sum).to eq(0)
    end

    it 'returns the correct sum after two rolls of frame 1' do
      subject.scores.push([3, 4])
      expect(subject.sum).to eq(7)
    end
  end

  describe '#add' do
    it 'only accepts a number between 1 and 10 for the first roll' do
      expect { subject.add(11) }.to raise_error 'Please enter a number from 1 to 10'
    end

    it 'only accepts a number from 1 to 10 minus the first roll score for the second roll' do
      subject.add(4)
      expect { subject.add(7) }.to raise_error 'Please enter a number from 1 to 6'
    end

    it 'adds a score to the scores array' do
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
      expect(subject.scores).to eq([[5, 4], [6]])
    end

    context 'scoring of spares' do
      it 'after a spare the next roll is added to the score of the frame with the spare' do
        subject.add(5)
        subject.add(5)
        subject.add(6)
        expect(subject.scores).to eq([[5, 11], [6]])
      end
    end

    context 'strikes' do
      it 'skips the next roll of the frame' do
        subject.add(10)
        expect(subject.scores).to eq([[10, 0]])
      end
      it 'after a strike the next two rolls are added to the score of the frame with the spare' do
        subject.add(10)
        subject.add(5)
        subject.add(3)
        expect(subject.scores).to eq([[10, 8], [5, 3]])
      end
    end

    context 'ending the game' do
      it 'while not getting spares or strikes, will not let you add a score after frame 10 is finished' do
        20.times { subject.add(3) }
        subject.add(3)
        expect(subject.add(3)).to eq('The game has finished')
      end

      it 'after a strike or spare in frame 10, will not let you add a score after frame 10 is finished' do
        19.times { subject.add(3) }
        subject.add(10)
        subject.add(3)

        expect(subject.add(3)).to eq('The game has finished')
      end
    end
  end
end
