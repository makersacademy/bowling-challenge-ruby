# frozen_string_literal: true

require 'scorecard'

describe ScoreCard do
  describe '.user_request' do
    it 'will ask the user for input' do
      expect { subject.user_request }.to output("Please enter a score:\n").to_stdout
    end
  end

  describe '.input_checker' do
    num = '1'
    incorrect_statement = 'one'

    it 'will return the input as an integer if possible' do
      Object.any_instance.stub(gets: num)

      expect(subject.input_checker(gets)).to eq 1
    end

    it 'will raise an error if the input is not acceptable' do
      Object.any_instance.stub(gets: incorrect_statement)

      expect{ subject.input_checker(gets) }.to output("That is an incorrect input\n").to_stdout
    end
  end

  describe '.current_total' do
    num = 11

    it 'will print the current total score' do
      score = double(:score, :total_score => num)

      scorecard = ScoreCard.new
      p scorecard
      p score
      p subject.current_total
      p scorecard.current_total
      p num
      p score.total_score

      expect{ subject.current_total }.to output(num.to_s).to_stdout
    end
  end
end
