require './game'

describe Game do
  context 'new instances of Game' do

    it 'should be an instance of Game' do
      expect(subject).to be_an_instance_of Game
    end

    it 'initializes with a score of zero' do
      expect(subject.score).to eq 0
    end

    it 'initializes on frame 1' do
      expect(subject.frame).to eq 1
    end

    it 'initializes with 10 pins' do
      expect(subject.pins).to eq 10
    end

    it 'initializes with an empty array for the whole game' do
      expect(subject.game_rolls).to eq []
    end

    it 'initializes with an empty array for the frame' do
      expect(subject.frame_rolls).to eq []

    end
  end

  context 'playing the game' do
    it 'responds to play method' do
      expect(subject).to respond_to(:play).with(0).arguments
    end
  end

  context 'play_frame' do
    let(:testgame) {Game.new}
    it 'returns the current score for the frame' do
      allow_any_instance_of(Game).to receive(:gets).and_return('4','5')
      testgame.play_frame
    end
  end

  context 'roll 1' do
    it "saves the player's first roll to frame_rolls" do
      allow_any_instance_of(Game).to receive(:gets).and_return('4')
      subject.play_roll_1
      expect(subject.frame_rolls).to eq [4]
    end

    it 'does not store rolls over 10' do
      allow_any_instance_of(Game).to receive(:gets). and_return('11','4')
      expect(subject.play_roll_1).to eq [4]
    end

    it 'saves 10, 0 to frame_rolls if player gets a strike' do
      allow_any_instance_of(Game).to receive(:gets).and_return('10')
      subject.play_roll_1
      expect(subject.frame_rolls).to eq [10,0]
    end
  end

  context 'roll 2' do
    let(:testgame) { Game.new }
    it 'saves roll 2 to frame_rolls' do
      testgame.frame_rolls = [4]
      allow_any_instance_of(Game).to receive(:gets).and_return('5')
      testgame.play_roll_2
      expect(testgame.frame_rolls).to eq [4,5]
    end

    it 'does not store rolls over the remaining number of pins' do
      testgame.frame_rolls = [7]
      testgame.pins = 3
      allow_any_instance_of(Game).to receive(:gets). and_return('4','3')
      expect(testgame.play_roll_2).to eq [7,3]
    end
  end

  context 'reset frame' do
    let(:testgame) { Game.new }

    it 'resets the pins to 10' do
      testgame.pins = 5
      testgame.reset_frame
      expect(testgame.pins).to eq 10
    end

    it 'resets the frame rolls to []' do
      testgame.frame_rolls = [7,2]
      testgame.reset_frame
      expect(testgame.frame_rolls).to eq []
    end
  end

  context 'play_frame_10' do
    let(:testgame) {Game.new}
    it 'allows the player a third roll if they got a strike on roll 1' do
      testgame.game_rolls = [[4,5],[5,5],[10,0],[4,6],[7,3],[9,1],[0,3],[7,1],[9,1]]
      allow_any_instance_of(Game).to receive(:gets).and_return('10','10','10')
      expect(subject.play_frame_10).to eq [10,10,10]
    end
  end

  context 'play_frame_10 roll 1' do
    it "saves the player's first roll to frame_rolls" do
      allow_any_instance_of(Game).to receive(:gets).and_return('4')
      subject.play_roll_1_10
      expect(subject.frame_rolls).to eq [4]
    end

    it 'does not store rolls over 10' do
      allow_any_instance_of(Game).to receive(:gets). and_return('11','4')
      expect(subject.play_roll_1_10).to eq [4]
    end

    it 'resets the pins if the player gets a strike on roll 1' do
      allow_any_instance_of(Game).to receive(:gets).and_return('10')
      subject.play_roll_1_10
      expect(subject.pins).to eq 10
    end
  end

  context 'play_frame_10 roll_2_10' do
    let(:testgame) { Game.new }
    it 'saves roll 2 to frame_rolls' do
      testgame.frame_rolls = [10]
      testgame.pins = 10
      allow_any_instance_of(Game).to receive(:gets).and_return('5')
      testgame.play_roll_2_10
      expect(testgame.frame_rolls).to eq [10,5]
    end

    it 'resets the pins if the player gets a strike on roll 2' do
      testgame.frame_rolls = [10]
      testgame.pins = 10
      allow_any_instance_of(Game).to receive(:gets).and_return('10')
      testgame.play_roll_2_10
      expect(testgame.pins).to eq 10
    end

    it 'does not store rolls over the remaining number of pins' do
      testgame.frame_rolls = [10]
      testgame.pins = 10
      allow_any_instance_of(Game).to receive(:gets). and_return('11','3')
      expect(testgame.play_roll_2_10).to eq [10,3]
    end
  end

  context 'play_frame_10 roll_2_10_a' do
    let(:testgame) { Game.new }
    it 'saves roll 2 to frame_rolls' do
      testgame.frame_rolls = [4]
      testgame.pins = 6
      allow_any_instance_of(Game).to receive(:gets).and_return('5')
      testgame.play_roll_2_10_a
      expect(testgame.frame_rolls).to eq [4,5,0]
    end

    it 'resets the pins if the player gets a spare on roll 2' do
      testgame.frame_rolls = [4]
      testgame.pins = 6
      allow_any_instance_of(Game).to receive(:gets).and_return('6')
      testgame.play_roll_2_10_a
      expect(testgame.pins).to eq 10
    end

    it 'does not store rolls over the remaining number of pins' do
      testgame.frame_rolls = [7]
      testgame.pins = 3
      allow_any_instance_of(Game).to receive(:gets). and_return('4','3')
      expect(testgame.play_roll_2_10_a).to eq [7,3]
    end
  end

  context 'play_frame_10 roll_3_10' do
    let(:testgame) { Game.new }
    it 'saves roll 3 to frame_rolls' do
      testgame.frame_rolls = [10,10]
      testgame.pins = 10
      allow_any_instance_of(Game).to receive(:gets).and_return('5')
      testgame.play_roll_3_10
      expect(testgame.frame_rolls).to eq [10,10,5]
    end

    it 'does not reset the pins if the player gets a strike on roll 3' do
      testgame.frame_rolls = [10,10]
      testgame.pins = 10
      allow_any_instance_of(Game).to receive(:gets).and_return('10')
      testgame.play_roll_3_10
      expect(testgame.pins).to eq 0
    end

    it 'does not store rolls over the remaining number of pins' do
      testgame.frame_rolls = [10,10]
      testgame.pins = 10
      allow_any_instance_of(Game).to receive(:gets). and_return('11','3')
      expect(testgame.play_roll_3_10).to eq [10,10,3]
    end
  end

  context 'play_frame_10 roll_3_10_a' do
    let(:testgame) { Game.new }
    it 'saves roll 3 to frame_rolls' do
      testgame.frame_rolls = [10,3]
      testgame.pins = 7
      allow_any_instance_of(Game).to receive(:gets).and_return('5')
      testgame.play_roll_3_10_a
      expect(testgame.frame_rolls).to eq [10,3,5]
    end

    it 'does not reset the pins if the player gets a spare on roll 3' do
      testgame.frame_rolls = [10,3]
      testgame.pins = 7
      allow_any_instance_of(Game).to receive(:gets).and_return('7')
      testgame.play_roll_3_10_a
      expect(testgame.pins).to eq 0
    end

    it 'does not store rolls over the remaining number of pins' do
      testgame.frame_rolls = [10,4]
      testgame.pins = 6
      allow_any_instance_of(Game).to receive(:gets). and_return('7','3')
      expect(testgame.play_roll_3_10_a).to eq [10,4,3]
    end
  end

  context 'calculates the score' do
    let(:testgame) {Game.new}
    it 'defers calculation of current score if latest frame included a spare' do
      testgame.game_rolls = [[4,5],[5,5]]
      expect(testgame.current_score).to eq 'score depends on next frame'
    end

    it 'defers calculation of current score if latest frame included a strike' do
      testgame.game_rolls = [[4,5],[10,0]]
      expect(testgame.current_score).to eq 'score depends on next frame'
    end

    it 'refers to the next frame to calculate the score after a spare' do
      testgame.game_rolls = [[4,5],[5,5],[3,2]]
      expect(testgame.frames_scores).to eq 27
    end

    it 'refers to the next frame to calculate the score after a strike' do
      testgame.game_rolls = [[4,5],[10,0],[3,2]]
      expect(testgame.frames_scores).to eq 29
    end

    it 'sums the frames so far where the last frame not spare or strike' do
      testgame.game_rolls = [[4,5],[10,0],[3,2]]
      expect(testgame.current_score).to eq 29
    end

    it 'calculates the final score' do
      testgame.game_rolls = [[4,5],[5,5],[10,0],[4,6],[7,3],[9,1],[0,3],[7,1],[9,1],[10,10,10]]
      expect(testgame.final_score).to eq 156
    end
  end
end
