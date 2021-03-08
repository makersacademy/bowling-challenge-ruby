require 'scorecalculator'

describe ScoreCalculator do
  describe '#input' do
    it 'lets the user input the score of the current frame which returns the current score and frame' do
      expect { subject.input(5, 4) }.to output("You scored 9 for frame 1. Your overall score so far is 9\n").to_stdout
    end

    it 'increases the framecount when there are more inputs' do
      subject.input(5, 4)
      expect { subject.input(3, 3) }.to output("You scored 6 for frame 2. Your overall score so far is 15\n").to_stdout
    end

    it 'adds bonus points to the overall score if there was a spare in the previous frame' do
      subject.input(5, 5)
      expect { subject.input(3, 3) }.to output("You scored 6 for frame 2. Your overall score so far is 19\n").to_stdout
    end

    it 'adds bonus points to the overall score if there was a strike in the previous frame' do
      subject.input(10)
      expect { subject.input(4, 5) }.to output("You scored 9 for frame 2. Your overall score so far is 28\n").to_stdout
    end

    it 'adds bonus points to the overall score correctly if there was a strike after a strike' do
      subject.input(10) # 23
      subject.input(10) # 18
      subject.input(3, 5) # 8
      expect do
        subject.input(4, 5)
      end.to output("You scored 9 for frame 4. Your overall score so far is 58\n").to_stdout # 9
    end

    it 'includes bonus points in a different way allowing max of 3 rolls in the tenth frame where there is a strike' do
      9.times { subject.input(3, 4) }
      message = "You scored 29 for frame 10. Your overall score so far is 92\nYou have finished the game, yay!\n"
      expect { subject.input(10, 10, 9) }.to output(message).to_stdout
    end

    it 'only allows two score inputs in the tenth frame if there is no strike or spare' do
      9.times { subject.input(3, 4) }
      expect do
        subject.input(4, 5, 6)
      end.to raise_error("Max of 2 score inputs allowed if you haven't striked/spared in frame 10")
    end

    it 'calculates the correct overall score when there is a perfect game of strikes' do
      9.times { subject.input(10) }
      message = "You scored 30 for frame 10. Your overall score so far is 300\nCongrats you scored a perfect game!\n"
      expect { subject.input(10, 10, 10) }.to output(message).to_stdout
    end

    it 'calculates the correct overall score when there is a spare in the last frame' do
      9.times { subject.input(5, 4) }
      message = "You scored 12 for frame 10. Your overall score so far is 93\nYou have finished the game, yay!\n"
      expect { subject.input(5, 5, 2) }.to output(message).to_stdout
    end

    it 'tells the user it is a gutter game if user has inputted all zeros for 10 frames' do
      9.times { subject.input(0, 0) }
      message = "You scored 0 for frame 10. Your overall score so far is 0\nSorry this is a complete gutter game...\n"
      expect { subject.input(0, 0) }.to output(message).to_stdout
    end

    it 'raises an error asking for another input for the frame if the user only enter 1 score less than 10' do
      expect do
        subject.input(9)
      end.to raise_error("You need to input both scores of the current frame if you don't have a strike")
    end

    it 'raises an error if input is more than 10' do
      expect { subject.input(11) }.to raise_error('Score in the frame cannot exceed 10!')
    end

    it 'raises an error if total input is more than 10 in frames before 10' do
      expect { subject.input(5, 6) }.to raise_error('Score in the frame cannot exceed 10!')
    end
  end

  describe '#scoreboard' do
    it 'shows the rolls for each frame so far' do
      subject.input(1, 5)
      subject.input(4, 5)
      expect { subject.scoreboard }.to output("Frame 1: [1, 5] | 6 | 6\nFrame 2: [4, 5] | 9 | 15\n").to_stdout
    end

    it 'includes bonus points in the frame score when there is a strike' do
      subject.input(10)
      subject.input(4, 5)
      expect { subject.scoreboard }.to output("Frame 1: [10, [4, 5]] | 19 | 19\nFrame 2: [4, 5] | 9 | 28\n").to_stdout
    end

    it 'includes bonus points in the frame score when there is a spare' do
      subject.input(5, 5)
      subject.input(3, 3)
      expect { subject.scoreboard }.to output("Frame 1: [5, 5, 3] | 13 | 13\nFrame 2: [3, 3] | 6 | 19\n").to_stdout
    end
  end
end
