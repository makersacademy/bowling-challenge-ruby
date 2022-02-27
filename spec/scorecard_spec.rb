# frozen_string_literal: true

describe ScoreCard do
  subject(:scorecard) { described_class.new }

  describe '#log_roll' do
    it 'returns game complete if trying to add a roll after 10 frames are done' do
      12.times do
        scorecard.log_roll(10)
      end
      expect(scorecard.log_roll(10)).to eq :game_complete
    end
  end

  describe '#current_frame_number' do
    it 'gives frame number at the start of the game' do
      expect(scorecard.current_frame_number).to eq 0
    end

    it 'gives frame number at the end of a game' do
      12.times do
        scorecard.log_roll(10)
      end
      expect(scorecard.current_frame_number).to eq 10
    end

    it 'gives frame number mid game' do
      5.times do
        scorecard.log_roll(10)
      end
      expect(scorecard.current_frame_number).to eq 5
    end
  end

  describe '#score' do
    it 'start of the game no rolls' do
      expect(scorecard.score).to eq 0
    end

    it 'first frame, first roll, no strike' do
      scorecard.log_roll(7)
      expect(scorecard.score).to eq 0
    end

    it 'first frame, second roll, no spare' do
      scorecard.log_roll(7)
      scorecard.log_roll(2)
      expect(scorecard.score).to eq 9
    end

    it 'first frame and a spare' do
      scorecard.log_roll(7)
      scorecard.log_roll(3)
      expect(scorecard.score).to eq 0
    end

    it 'second frame first roll, no bonus' do
      scorecard.log_roll(7)
      scorecard.log_roll(2)
      scorecard.log_roll(4)

      expect(scorecard.score).to eq 9
    end

    it 'second frame second roll, no bonus' do
      scorecard.log_roll(7)
      scorecard.log_roll(2)
      scorecard.log_roll(4)
      scorecard.log_roll(2)
      expect(scorecard.score).to eq 15
    end

    it 'second frame first roll, spare on previous frame' do
      scorecard.log_roll(7)
      scorecard.log_roll(3)
      scorecard.log_roll(4)

      expect(scorecard.score).to eq 14
    end

    it 'second frame first roll, strike on previous frame' do
      scorecard.log_roll(10)
      scorecard.log_roll(4)

      expect(scorecard.score).to eq 0
    end

    it 'second frame second roll, strike on previous frame' do
      scorecard.log_roll(10)
      scorecard.log_roll(4)
      scorecard.log_roll(5)
      expect(scorecard.score).to eq 28
    end

    it 'third frame 2 non bonus rolls, second frame strike, first frame strike' do
      scorecard.log_roll(10)
      scorecard.log_roll(10)
      scorecard.log_roll(4)
      scorecard.log_roll(5)
      expect(scorecard.score).to eq 52
    end

    it 'second frame second roll is spare, strike on previous frame' do
      scorecard.log_roll(10)
      scorecard.log_roll(3)
      scorecard.log_roll(7)
      expect(scorecard.score).to eq 20
    end

    it 'is a full game no end bonus' do
      scorecard.log_roll(3)
      scorecard.log_roll(1)
      scorecard.log_roll(6)
      scorecard.log_roll(3)
      scorecard.log_roll(2)
      scorecard.log_roll(1)
      scorecard.log_roll(0)
      scorecard.log_roll(0)
      scorecard.log_roll(8)
      scorecard.log_roll(0)
      scorecard.log_roll(0)
      scorecard.log_roll(9)
      scorecard.log_roll(10)
      scorecard.log_roll(5)
      scorecard.log_roll(5)
      scorecard.log_roll(8)
      scorecard.log_roll(1)
      scorecard.log_roll(1)
      scorecard.log_roll(3)

      expect(scorecard.score).to eq 84
    end

    it "You're awesome, strikes in every frame" do
      12.times do
        scorecard.log_roll(10)
      end
      expect(scorecard.score).to eq 300
    end

    it 'a spare and strike on the last frame of the game' do
      9.times do
        scorecard.log_roll(10)
      end

      scorecard.log_roll(7)
      scorecard.log_roll(3)
      scorecard.log_roll(10)

      expect(scorecard.score).to eq 277
    end

    it 'having a bad day.. Gutter Game!' do
      20.times do
        scorecard.log_roll(0)
      end
      expect(scorecard.score).to eq 0
    end

    it 'almost all strikes and spares, full game' do
      5.times do
        scorecard.log_roll(10)
      end
      scorecard.log_roll(7)
      scorecard.log_roll(3)
      scorecard.log_roll(10)
      scorecard.log_roll(7)
      scorecard.log_roll(1)
      scorecard.log_roll(4)
      scorecard.log_roll(6)
      scorecard.log_roll(10)
      scorecard.log_roll(10)
      scorecard.log_roll(10)

      expect(scorecard.score).to eq 233
    end
  end
end
