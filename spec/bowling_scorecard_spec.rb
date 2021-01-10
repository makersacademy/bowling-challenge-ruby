require_relative '../lib/bowling_scorecard'

describe Scorecard do
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
      subject.input_roll
      subject.input_roll
      subject.input_roll
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
end
