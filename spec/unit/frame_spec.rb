require 'frame'

describe Frame do
  subject(:frame) { described_class.new(1) }
  let(:frame1) { described_class.new(1) }
  let(:frame2) { described_class.new(2) }

  it 'stores which number frame it is' do
    expect(frame.number).to eq 1
  end

  it 'starts with an empty array of scores' do
    expect(frame.scores).to be_empty
  end

  describe '#add' do
    it 'adds a score to scores' do
      expect { frame.add(1) }.to change { frame.scores.length }.by(1)
    end
    it 'raises an error if there are already two scores' do
      frame.add(1)
      frame.add(1)
      expect { frame.add(1) }.to raise_error 'This frame is complete'
    end
  end

  describe '#complete?' do
    context 'if two scores have been added' do
      it 'returns true' do
        frame.add(1)
        frame.add(1)
        expect(frame.complete?).to be true
      end
    end
    context 'if a strike has been scored' do
      it 'returns true' do
        frame.add(Frame::TOTAL_PINS)
        expect(frame.complete?).to be true
      end
    end
    context 'if there are less than 2 scores and no strike' do
      it 'returns false' do
        frame.add(Frame::TOTAL_PINS - 1)
        expect(frame.complete?).to be false
      end
    end
  end

  describe '#bonus_complete?' do
    context 'if the frame was a standard score' do
      it 'returns true' do
        frame.add(1)
        frame.add(1)
        expect(frame.bonus_complete?).to be true
      end
    end
    context 'if a spare has been scored' do
      before do
        frame1.add(Frame::TOTAL_PINS - 1)
        frame1.add(1)
      end
      context 'and the bonus has not been added' do
        it 'returns false' do
          expect(frame1.bonus_complete?).to be false
        end
      end
      context 'and the bonus has been added' do
        it 'returns true' do
          frame1.increase_bonus(5)
          expect(frame1.bonus_complete?).to be true
        end
      end
    end
    context 'if a strike has been scored' do
      before do
        frame1.add(Frame::TOTAL_PINS)
      end
      context 'and no bonus rolls have been added' do
        it 'returns false' do
          frame1.increase_bonus(5)
          expect(frame1.bonus_complete?).to be false
        end
      end
      context 'and one bonus roll has been added' do
        it 'returns false' do
          frame1.increase_bonus(5)
          expect(frame1.bonus_complete?).to be false
        end
      end
      context 'and both bonus rolls have been added' do
        it 'returns true' do
          frame1.increase_bonus(5)
          frame1.increase_bonus(3)
          expect(frame1.bonus_complete?).to be true
        end
      end
    end
  end

  describe '#strike' do
    context 'if a strike has been scored' do
      it 'returns true' do
        frame.add(Frame::TOTAL_PINS)
        expect(frame.strike?).to be true
      end
    end
    context 'if a strike has not been scored' do
      it 'returns false' do
        frame.add(Frame::TOTAL_PINS - 1)
        frame.add(1)
        expect(frame.strike?).to be false
      end
    end
  end

  describe '#spare' do
    context 'if a spare has been scored' do
      it 'returns true' do
        frame.add(Frame::TOTAL_PINS - 1)
        frame.add(1)
        expect(frame.spare?).to be true
      end
    end
    context 'if a spare has not been scored' do
      it 'returns false' do
        frame.add(1)
        frame.add(1)
        expect(frame.spare?).to be false
      end
    end
  end

  describe '#score' do
    context 'if no rolls have taken place' do
      it 'returns 0' do
        expect(frame.score).to eq 0
      end
    end
    context 'once rolls have taken place' do
      it 'returns the sum of the rolls' do
        roll_scores = [3, 4]
        roll_scores.each { |roll| frame.add(roll) }
        expect(frame.score).to eq roll_scores.sum
      end
      context 'if bonus points were added' do
        it 'returns the sum of rolls and bonus points' do
          roll_scores = [3, 7, 6]
          frame1.add(roll_scores[0])
          frame1.add(roll_scores[1])
          frame1.increase_bonus(roll_scores[2])
          expect(frame1.score).to eq roll_scores.sum
        end
      end
    end
  end
end
