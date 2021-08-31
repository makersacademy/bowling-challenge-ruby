require_relative '../lib/game'
require_relative '../lib/frame'

describe Game do
  let(:frame_class) { class_double(Frame).as_stubbed_const }
  let(:game) { described_class.new }

  describe '#initialize' do
    it 'should initialize with empty scores array' do
      expect(game.scores).to eq([])
    end

    it 'should initialize with an array with one new frame instance' do
      expect(frame_class).to receive(:new)
      expect(game.frames).to be_a(Array)
      expect(game.frames.size).to eq(1)
    end
  end

  describe '#score' do
    it 'should record my current score' do
      game.score(6)
      expect(game.last_score).to eq(6)
    end

    it 'should only accept scores from 1-10' do
      expect { game.score(11) }.to raise_error 'can only accept scores 0-10'
      expect { game.score(-11) }.to raise_error 'can only accept scores 0-10'
    end
  end

  describe '#check_frame' do
    it 'should call #new_frame after two rolls' do
      expect(game).to receive(:new_frame)
      game.score(6)
      game.score(1)
    end

    it 'should call #new_frame after a strike' do
      expect(game).to receive(:new_frame)
      game.score(10)
    end

    it 'should not call #new_frame after one non-strike roll' do
      expect(game).not_to receive(:new_frame)
      game.score(5)
    end
  end

  describe '#new_frame' do
    it 'should call #close_frame' do
      expect(game.frames.last).to receive(:close_frame)
      game.new_frame
    end

    it 'should raise error if the game is over' do
      9.times { game.new_frame }
      expect { game.new_frame }.to raise_error "Game over with score #{game.final_score}"
    end

    it 'should instantiate new frame with multiplier 2 after a strike' do
      game
      expect(frame_class).to receive(:new).with(2)
      game.score(10)
    end

    it 'should instantiate new frame with multiplier 1 after a spare' do
      game
      expect(frame_class).to receive(:new).with(1)
      game.score(5)
      game.score(5)
    end

    it 'should instantiate new frame with multiplier 0 after non-strike/spare roll' do
      game
      expect(frame_class).to receive(:new)
      game.score(3)
      game.score(3)
    end
  end

  describe '#final_score' do
    it 'should return the final score' do
      game.score(10)
      game.score(7)
      game.score(3)
      game.score(4)
      game.score(4)
      expect(game.final_score).to eq(42)
    end
  end
end
