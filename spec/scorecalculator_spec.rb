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

    it 'adds bonus points to the overall score correctly if there was a strike after a strike' do
      subject.input(10) #23
      subject.input(10) #18
      subject.input(3,5) #8
      expect{subject.input(4,5)}.to output("You scored 9 for frame 4. Your overall score so far is 58\n").to_stdout #9
    end

    it 'includes bonus points in a different way allowing max of 3 rolls in the tenth frame where there is a strike' do
      subject.input(3, 4)
      subject.input(4, 5)
      subject.input(2, 3)
      subject.input(6, 2)
      subject.input(2, 3)
      subject.input(2, 6)
      subject.input(2, 6)
      subject.input(4, 5)
      subject.input(5, 2)
      expect{subject.input(10,10,9)}.to output("This the last frame!\nYou scored 29 for frame 10. Your overall score so far is 95\n").to_stdout
    end
  end

  describe '#frame_info' do
    it 'returns details about a specific frame' do
      subject.input(1,5)
      expect{subject.frame_info(1)}.to output("Frame 1: [1, 5] | 6\n").to_stdout
    end
  end

  describe '#scoreboard' do
    it 'shows the rolls for each frame so far' do
      subject.input(1,5)
      subject.input(4,5)
      expect{subject.scoreboard}.to output("Frame 1: [1, 5] | 6 | 6\nFrame 2: [4, 5] | 9 | 15\n").to_stdout
    end

    it 'includes bonus points in the frame score when there is a strike' do
      subject.input(10)
      subject.input(4,5)
      expect{subject.scoreboard}.to output("Frame 1: [10, 9] | 19 | 19\nFrame 2: [4, 5] | 9 | 28\n").to_stdout
    end

    it 'includes bonus points in the frame score when there is a spare' do
      subject.input(5,5)
      subject.input(3,3)
      expect{subject.scoreboard}.to output("Frame 1: [5, 5, 3] | 13 | 13\nFrame 2: [3, 3] | 6 | 19\n").to_stdout
    end

  end
end
