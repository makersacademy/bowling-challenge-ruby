# frozen_string_literal: true

require 'scorecard'

describe ScoreCard do
  num = 1
  describe '.input' do
    it 'will return the inputted score' do
      expect(subject.input(num)).to eq num
    end
  end

  describe '.user_request' do
    it 'will ask the user for input' do
      Object.any_instance.stub(gets: num)

      expect { subject.user_request }.to output("Please enter a score:\n").to_stdout
      expect(subject.user_request).to eq(num)
    end
  end
end
