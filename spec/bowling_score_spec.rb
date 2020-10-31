require 'bowling_score'

describe BowlingScore do
  let (:subject) { described_class.new }

  context 'without rolling any strikes or spares' do
    it 'gives the total score of all rolls' do
      20.times {subject.roll(4)}
      expect(subject.total_score).to eq 80
    end

    it 'gives the total score for 10 gutter rolls' do
      20.times {subject.roll(0)}
      expect(subject.total_score).to eq 0
    end
  end

  context 'calculates correct score with strikes' do
    it 'gives the total score of all rolls with one strike' do
      subject.roll(10)
      18.times {subject.roll(5)}
      expect(subject.total_score).to eq 110
    end
  end
end