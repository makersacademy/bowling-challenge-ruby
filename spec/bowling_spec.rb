require 'bowling'

describe Bowling do
  let (:subject) { described_class.new }

  context 'without rolling any strikes or spares' do

    it 'gives the total score of all rolls' do
      20.times {subject.roll(4)}
      expect(subject.total_score).to eq 80
    end
  end
end

