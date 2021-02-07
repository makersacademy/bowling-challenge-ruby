require 'game'

describe Game do
  subject(:game) { described_class.new }

  it {is_expected.to respond_to :play_game }
  it {is_expected.to respond_to :play_frame }
  it {is_expected.to respond_to :calculate_frame_score }
  it {is_expected.to respond_to :strike?}
  it {is_expected.to respond_to :spare? }

  # describe '#creating' do
  #   it 'initalizes a Game object in the correct conditions' do
  #     game = Game.new
  #     expect(game.total_score).to eq 0
  #     expect(game.current_frame).to eq 1
  #     expect(game.strike).to eq false
  #     expect(game.spare).to eq false
  #   end
  # end
  describe '#total_score' do
    it 'should hold the players total score' do
      game.calculate_frame_score(3,7)
      game.calculate_frame_score(2,5)
      expect(game.total_score).to eq 19
    end
  end

  describe '#current_frame' do
    it 'should keep track of how many times the player has bowled' do
      game.calculate_frame_score(3,7)
      game.calculate_frame_score(2,5)
      game.calculate_frame_score(5,1)
      expect(game.current_frame).to eq 3
    end
  end

  describe '#current_frame' do
    it 'should keep track of how many times the player has bowled' do
      game.calculate_frame_score(3,7)
      game.calculate_frame_score(2,5)
      game.calculate_frame_score(5,1)
      expect(game.current_frame).to eq 3
    end
  end



  describe '#strike?' do
    it 'changes the strike value to true when a strike is scored' do
      game.strike?(10)
      expect(game.strike).to eq true
    end

    it 'ensures the value of strike is false when a strike is not scored' do
      game.strike?(1)
      expect(game.strike).to eq false
    end
  end

  describe '#spare?' do
    it 'changes the spare value to true when a spare is scored' do
      game.spare?(7, 3)
      expect(game.spare).to eq true
    end

    it 'checks the value of spare is false when a spare is not scored' do
      game.spare?(1, 2)
      expect(game.spare).to eq false
    end
  end

  describe '#calculate_frame_score' do
    it 'calculates the score of a frame, when neither a spare or strike is scored' do
      game.calculate_frame_score(1, 2)
      expect(game.total_score).to eq 3
    end

    it 'calculated a score with a strike correctly' do
      game.strike?(10)
      expect(game.calculate_frame_score(2, 3)).to eq 10
    end

    it 'calculated a score with a spare correctly' do
      game.spare?(3, 7)
      expect(game.calculate_frame_score(5, 3)).to eq 13
    end

  end

end
