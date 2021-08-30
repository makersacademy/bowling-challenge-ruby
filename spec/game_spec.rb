require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/frame'

describe Game do
  let(:player) { instance_double(Player) }
  let(:frame_class) { class_double(Frame).as_stubbed_const }
  let(:game) { described_class.new(player) }

  describe '#initialize' do
    it 'should initialize with empty scores array' do
      expect(game.scores).to eq([])
    end

    it 'should initialize with an array with one new frame instance' do
      expect(frame_class).to receive(:new)
      expect(game.frame).to be_a(Array)
      expect(game.frame.size).to eq(1)
    end

    it 'should require a player argument' do
      expect{ described_class.new }.to raise_error ArgumentError
    end
  end

  describe '#score' do
    it 'should record my current score' do
      game.score(6)
      expect(game.last_score).to eq(6)
    end

    it 'should only accept scores from 1-10' do
      expect{ game.score(11) }.to raise_error 'can only accept scores 1-10'
      expect{ game.score(-11) }.to raise_error 'can only accept scores 1-10'
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

    it 'should call #increment_frame after a strike' do
      expect(game).to receive(:increment_frame)
      game.score(5)
    end
  end

  # describe '#check_bonus' do
  #   it 'should add correct bonus to score if player rolls a spare' do
  #     game.score(6)
  #     game.score(4)
  #     game.score(4)
  #     expect(game.total_score).to eq(18)
  #   end

  #   it 'should not add any bonus if player fails to roll a spare' do
  #     game.score(6)
  #     game.score(3)
  #     game.score(4)
  #     expect(game.total_score).to eq(13)
  #   end
  # end
end
