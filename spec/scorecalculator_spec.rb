require 'scorecalculator'

describe ScoreCalculator do
  describe '#input' do
    it 'lets the user input the score of the current frame which returns the current score and frame' do
      expect{subject.input(5, 4)}.to output("You scored 9 for frame 1. Your overall score so far is 9\n").to_stdout
    end

    it 'increases the framecount when there are more inputs' do
      subject.input(5, 4)
      expect{subject.input(3, 3)}.to output("You scored 6 for frame 2. Your overall score so far is 15\n").to_stdout
    end

    it 'adds bonus points to the overall score if there was a spare in the previous frame' do
      subject.input(5, 5)
      expect{subject.input(3, 3)}.to output("You scored 6 for frame 2. Your overall score so far is 19\n").to_stdout
    end

    it 'adds bonus points to the overall score if there was a strike in the previous frame' do
      subject.input(10)
      expect{subject.input(4, 5)}.to output("You scored 9 for frame 2. Your overall score so far is 28\n").to_stdout
    end
  end
end
