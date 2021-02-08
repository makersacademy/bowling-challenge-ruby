# frozen_string_literal: true

require 'score'

describe Score do
  num = 2
  describe '.input' do
    it 'will include the inputted score' do
      expect(subject.add_score(num)).to include(num)
    end
  end

  describe '.total_score' do
    it 'will return a sum of the score' do
      subject.add_score(num)
      subject.add_score(num)
      expect(subject.total_score).to eq num * 2
    end
  end
end
