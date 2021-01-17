require_relative '../lib/bowling_scorecard'

describe Scorecard do
  describe '#keep_score' do
    it 'correctly handles the 10th frame with all strikes' do
      expect(subject).to receive(:gets).and_return('10').exactly(12).times
      subject.keep_score
      expect(subject.frame_scores.sum).to eq 300
    end

    it 'correctly handles the 10th frame with a spare' do
      allow(subject).to receive(:gets).and_return('10', '10', '10', '10', '10', '10', '10', '10', '10', '9', '1', '10')
      subject.keep_score
      expect(subject.frame_scores.sum).to eq 279
    end

    it 'correctly handles the 10th frame with a normal roll' do
      allow(subject).to receive(:gets).and_return('10', '10', '10', '10', '10', '10', '10', '10', '10', '9', '0')
      subject.keep_score
      expect(subject.frame_scores.sum).to eq 267
    end

    it 'correctly handles a mix of strikes and spares' do
      allow(subject).to receive(:gets).and_return('1', '1', '9', '1', '10', '1', '1', '9', '1', '9', '1', '10', '10', '9', '1', '10', '10', '10')
      subject.keep_score
      expect(subject.frame_scores.sum).to eq 174
    end

  end

  describe '#input_roll' do
    it 'adds the first roll result to the pins_knocked array' do
      expect(subject).to receive(:gets).and_return('1')
      subject.input_roll
      expect(subject.pins_knocked.first).to eq [1]
    end

    it 'adds the second roll result to the pins_knocked array' do
      expect(subject).to receive(:gets).and_return('1').twice
      subject.input_roll
      subject.input_roll
      expect(subject.pins_knocked.first).to eq [1, 1]
    end

    it 'adds new frame tuples to the pins_knocked array when previous frame complete' do
      expect(subject).to receive(:gets).and_return('1').exactly(3).times
      3.times { subject.input_roll }
      expect(subject.pins_knocked[1]).to eq [1]
    end
  end

  describe '#calculate_frame' do
    it 'adds the total score from knocked pins to the frame_scores array' do
      expect(subject).to receive(:gets).and_return('1').twice
      subject.input_roll
      subject.input_roll
      expect(subject.frame_scores.first).to eq 2
    end
  end

  describe '#add_strike' do
    it 'adds a strike flag to the relevant frame in the strikes_spares hash' do
      expect(subject).to receive(:gets).and_return('10')
      subject.input_roll
      expect(subject.strikes_spares[0]).to eq 'strike'
    end
  end

  describe '#add_spare' do
    it 'adds a spare flag to the relevant frame in the strikes_spares hash' do
      expect(subject).to receive(:gets).and_return('9')
      subject.input_roll
      expect(subject).to receive(:gets).and_return('1')
      subject.input_roll
      expect(subject.strikes_spares[0]).to eq 'spare'
    end
  end

  describe 'apply_bonus' do
    it 'adds correct bonus points to a strike frame' do
      expect(subject).to receive(:gets).and_return('10')
      subject.input_roll
      expect(subject).to receive(:gets).and_return('1').twice
      subject.input_roll
      subject.input_roll
      expect(subject.frame_scores.first).to eq 12
    end
  end

  describe 'apply_bonus' do
    it 'adds correct bonus points to a spare frame' do
      expect(subject).to receive(:gets).and_return('9')
      subject.input_roll
      expect(subject).to receive(:gets).and_return('1')
      subject.input_roll
      expect(subject).to receive(:gets).and_return('1').twice
      subject.input_roll
      subject.input_roll
      expect(subject.frame_scores.first).to eq 11
    end

    it 'accounts for doubles' do
      expect(subject).to receive(:gets).and_return('10').twice
      subject.input_roll
      subject.input_roll
      expect(subject).to receive(:gets).and_return('9')
      subject.input_roll
      expect(subject).to receive(:gets).and_return('0')
      subject.input_roll
      expect(subject.frame_scores.first).to eq 29
      expect(subject.frame_scores[1]).to eq 19
      expect(subject.frame_scores[2]).to eq 9
    end

    it 'accounts for turkeys' do
      expect(subject).to receive(:gets).and_return('10').exactly(3).times
      3.times { subject.input_roll }
      expect(subject).to receive(:gets).and_return('9')
      subject.input_roll
      expect(subject).to receive(:gets).and_return('0')
      subject.input_roll
      expect(subject.frame_scores.first).to eq 30
      expect(subject.frame_scores[1]).to eq 29
      expect(subject.frame_scores[2]).to eq 19
      expect(subject.frame_scores[3]).to eq 9
    end
  end

end
