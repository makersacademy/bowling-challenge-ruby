require 'bowling_game'

describe BowlingGame do
  let(:new_game) { BowlingGame.new }
  let(:scorecard ) { double  "Scorecard" }
  let(:test_roll1) { 5 }
  let(:test_roll2) { 2 }
  let(:test_strike) { 10 }
  let(:test_spare1) { 3 }
  let(:test_spare2) { 7 }

  it 'initializes a new game set up' do
    expect(new_game.current_frame).to eq 1
    expect(new_game.strike).to eq false
    expect(new_game.spare).to eq false
    expect(new_game.scorecard).to be_a Scorecard
  end

  context 'rolls are compelte with no strike or spare' do
    describe '.roll_1' do
    it 'confirmation of roll 1 complete' do
      expect(new_game.roll_1(test_roll1)).to eq "Nice roll! Let's Roll again!"
      expect(new_game.roll_1(test_roll2)).to eq "Nice roll! Let's Roll again!"
    end
  end

    describe '.roll_2' do
      it 'confirmation of roll 2 complete' do
        expect(new_game.roll_2(test_roll1)).to eq "Great Job! That's the end of this frame"
        expect(new_game.roll_2(test_roll2)).to eq "Great Job! That's the end of this frame"
      end
    end

    describe '.roll_3' do
      it 'confirmation of only being able to roll a third ball in the 10th frame' do
        expect(new_game.roll_3(test_roll1)).to eq "You can only roll a third time in the 10th frame"
        expect(new_game.roll_3(test_roll2)).to eq "You can only roll a third time in the 10th frame"
      end
    end
  end

  context 'player gets a strike' do
    before do
      new_game.roll_1(test_strike)
    end

    it 'comfirms player has got a strike' do
      expect(new_game.roll_1(test_strike)).to eq "Strike!"
    end

    it 'changes strike to true when the first roll has a value of 10' do
      expect(new_game.strike).to eq true
    end

    it 'changes strike back to false when bonus is added to scorecard' do
      new_game.roll_1(test_strike)
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2)
      expect(new_game.strike).to eq false
    end
  end

  context 'player gets a spare' do
    before do
      new_game.roll_1(test_spare1)
      new_game.roll_2(test_spare2)
    end

    it 'comfirms player has got a spare' do
      new_game.roll_1(test_spare1)
      expect(new_game.roll_2(test_spare2)).to eq "Spare!"
    end

    it 'changes spare to true when the roll 1 and 2 equal 10 ' do
      expect(new_game.spare).to eq true
    end

    it 'changes spare back to false when bonus is added to scorecard' do
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2)
      expect(new_game.spare).to eq false
    end
  end

  context 'moving on to new frames' do
    describe '.next_frame' do
      it 'increases the frame number for each frame played' do
        3.times { new_game.next_frame }
        expect(new_game.current_frame).to eq 4
      end
    end

    it 'increases the frame number by 1 when adding to scorecard is complete' do
      new_game.update_scorecard
      expect(new_game.current_frame).to eq 2
    end
  end

  context '10th frame' do
    it 'allows a third roll if in the 10th frame the first roll equals a strike or spare' do
    9.times {
      new_game.roll_1(test_roll1)
      new_game.roll_2(test_roll2) }
      new_game.roll_1(test_strike)
      new_game.roll_2(test_roll1)
      expect(new_game.roll_3(test_roll2)).not_to eq "You can only roll a third time in the 10th frame"
    end
  end

  context 'ending the game' do
    describe '.end_of_game' do
      it 'returns a confrimation of game ending' do
        expect(new_game.end_of_game).to eq "End of game"
      end

      it 'returns a confrimation of game ending after roll 3' do
      9.times {
        new_game.roll_1(test_roll1)
        new_game.roll_2(test_roll2) }
        new_game.roll_1(test_strike)
        new_game.roll_2(test_roll1)
        expect(new_game.roll_3(5)).to eq "End of game"
      end
    end
  end
end
