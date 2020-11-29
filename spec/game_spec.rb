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

  context 'calculates the score' do
    let(:testgame) {Game.new}
    it 'calculates the current score' do
      testgame.game_rolls = [[4,5],[5,5]]
      expect(testgame.current_score).to eq 'score depends on next frame'
    end
  end
end
