require 'game'

describe Game do
  it { is_expected.to respond_to :play_a_frame }
  it { is_expected.to respond_to :calculate_frame_score }
  it { is_expected.to respond_to :strike? }
  it { is_expected.to respond_to :spare? }
  it { is_expected.to respond_to :extra_bonus_round? }
  it { is_expected.to respond_to :play_a_game }

  it 'initialises in the right conditions' do
    expect(Game.new.current_frame).to eq 1
    expect(Game.new.total_score).to eq 0
    expect(Game.new.strike).to eq false
    expect(Game.new.spare).to eq false
  end

  describe '#strike?' do
    let(:game) {Game.new}

    it 'correctly identifies a strike' do
    game.strike?(10)
    expect(game.strike).to eq true
    end

    it 'correctly identifies a non-strike' do
    game.strike?(5)
    expect(game.strike).to eq false
    end
  end

  describe '#spare?' do
    let(:game) {Game.new}

    it 'correctly identifies a spare' do
    game.spare?(6,4)
    expect(game.spare).to eq true
    end

    it 'correctly identifies a non-spare' do
    game.spare?(2,3)
    expect(game.spare).to eq false
    end
  end

  describe '#calculate_frame_score' do
    let(:game) {Game.new}

    it 'calculates a normal basic score' do    
    expect(game.calculate_frame_score(1, 4)).to eq 5
    end
  
    it 'calculates a score after a strike correctly' do 
    game.strike?(10)
    expect(game.calculate_frame_score(1, 4)).to eq 10
    end

    it 'calculates a score after a spare correctly' do 
    game.spare?(6,4)
    expect(game.calculate_frame_score(1, 4)).to eq 6
    end
  end
end
