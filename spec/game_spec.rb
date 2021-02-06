require 'game'

describe Game do
  let(:game) { Game.new }

  context '#input_roll' do
    it 'creates a frame to record the roll' do
      game.input_roll(4)
      expect(game.frames.length).to eq 1
    end

    it 'creates another frame when the first is completed' do
      game.input_roll(10)
      game.input_roll(8)
      expect(game.frames.length).to eq 2
    end

    it 'raises error for score inputs after 10th frame is completed' do
      allow(game.frames).to receive(:length).and_return(10)
      allow(game.frames[-1]).to receive(:completed?).and_return true
      expect { game.input_roll(4) }.to raise_error 'Game is finished'
    end

    it 'prints out current scores' do
      expect { game.input_roll(6) }.to output(a_string_including('Current scores:')).to_stdout
    end
  end

  context 'calculating scores' do
    it 'sums scores for first frame (no strike/spare)' do
      game.input_roll(4)
      game.input_roll(3)
      expect(game.scores[:frame_1]).to eq 7
    end

    it 'sums scores for second frame (no strike/spare)' do
      game.input_roll(4)
      game.input_roll(3)
      game.input_roll(2)
      game.input_roll(3)
      expect(game.scores[:frame_2]).to eq 5
    end

    it 'saves how many extra rolls are owed to a completed frame' do
      game.input_roll(10)
      game.input_roll(3)
      expect(game.owed_rolls[:frame_1]).to eq 1
    end

    it 'adds next roll if there was a spare' do
      game.input_roll(4)
      game.input_roll(6)
      expect(game.scores[:frame_1]).to eq 10

      game.input_roll(8)
      expect(game.scores[:frame_1]).to eq 18
      expect(game.scores[:frame_2]).to eq 8

      game.input_roll(1)
      expect(game.scores[:frame_1]).to eq 18
    end

    it 'adds next two rolls if there was a strike' do
      game.input_roll(10)
      game.input_roll(4)
      game.input_roll(3)
      expect(game.scores[:frame_1]).to eq 17
    end
  end

  context 'end of the game' do
    it 'prints a summary message at the end of the game' do
      rolls = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8]
      rolls.each { |roll| game.input_roll(roll) }

      expect { game.input_roll(6) }.to output(a_string_including('Final score:')).to_stdout
    end

    it 'gives a score of 133' do
      rolls = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6]
      rolls.each { |roll| game.input_roll(roll) }
      expect(game.total_score).to eq 133
    end

    it 'gives a score of 300 for a perfect game' do
      rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      rolls.each { |roll| game.input_roll(roll) }
      expect(game.total_score).to eq 300
    end

    it 'congratulates on a perfect game' do
      rolls = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      rolls.each { |roll| game.input_roll(roll) }
      expect { game.input_roll(10) }.to output(a_string_including('Perfect Game!')).to_stdout
    end
  end
end
