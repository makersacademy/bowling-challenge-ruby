require 'game'

describe Game do
  let(:game) { Game.new }

  describe '#add_frame' do
    it 'adds a frame consisting of 2 rolls' do
      game.add_rolls(1, 4)
      expect(game.frames).to include([1, 4])
    end

    it 'adds a frame with a bonus roll if a spare or strike is scored' do
      9.times { game.add_rolls(4, 5) }
      game.add_rolls(10, 10, 10)
      expect(game.frames).to include([10, 10, 10])
    end

    it "doesn't add bonus roll if no spare or strike" do
      9.times { game.add_rolls(4, 5) }
      game.add_rolls(3, 4, 6)
      expect(game.frames).not_to include([3, 4, 6])
    end
  end

  describe '#spare?' do
    context 'Checks if there is a SPARE'
    it 'returns true' do
      game_frames = [6, 4]
      expect(game.spare?(game_frames)).to eq true
    end

    it 'returns false' do
      game_frames = [4, 5]
      expect(game.spare?(game_frames)).to eq false
    end
  end

  describe '#strike?' do
    context 'Checks if there is a STRIKE'
    it 'returns true' do
      game_frames = [0, 10]
      expect(game.strike?(game_frames)).to eq true
    end

    it 'returns false' do
      game_frames = [9, 1]
      expect(game.strike?(game_frames)).to eq false
    end
  end

  describe '#max_ten_pins' do
    it 'raises an error if the frame exceedes 10' do
      expect { game.add_rolls(5, 6) }.to raise_error 'Sum of the rolls cannot exceede 10'
    end
  end

  describe '#last_frame?' do
    context "checks if it's the 10th frame"
    it 'is the 10th frame' do
      9.times { game.add_rolls(4, 5) }
      expect(game.last_frame?).to eq true
    end

    it 'is not the 10th frame' do
      game.add_rolls(1, 4)
      expect(game.last_frame?).to eq false
    end
  end
end
