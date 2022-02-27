require 'game'

describe Game do
  let(:frame) { double('frame')}
  # let(:game) { described_class.new(frame) }
  let(:game) { described_class.new}

  describe '#initialize' do
    it 'New games are initialized with a new frame' do
      expect(game.frames).to be_an_instance_of(Array)
    end
  end

  describe '#strike_bonus' do
    it 'checks to see if last frame had a strike 1' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:strike?) {true}
      # allow(frame).to receive(:knocked)
      game.roll(3)
      game.roll(3)
      game.roll(10)
      game.roll(2)
      expect(game.last_frame_strike?).to eq true
    end
  end

  describe '#score' do

    it 'Takes into account strike bonus' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:knocked)
      # allow(frame).to receive(:score) {17}
      game.roll(10)
      game.roll(3)
      game.roll(4)
      expect(game.frames[0].score).to eq 17
      end
    
    it 'Takes into account spare bonus' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:knocked)
      # allow(frame).to receive(:score) {14}
      game.roll(5)
      game.roll(5)
      game.roll(4)
      game.roll(3)
      expect(game.frames[0].score).to eq 14
      end

    end
  
  describe '#roll' do
    it 'accepts a number of pins as argument' do
      expect(game).to respond_to(:roll).with(1).argument
    end
  end

  describe '#last frame scenarios' do
    it 'gives correct total' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:knocked)
      # allow(frame).to receive(:score) {48}
      18.times {game.roll(1)}
      3.times {game.roll(10)}
      expect(game.total_score).to eq 48
    end
  end
  

  context 'Gutter Game' do
    it 'Scores 0 across 20 rolls' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:knocked)
      # allow(frame).to receive(:score) {0}
      20.times { game.roll(0)}
      expect(game.total_score).to eq 0
    end
  end

  context 'Perfect Game' do
    it 'Scores 300 across 12 rolls' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:knocked)
      # allow(frame).to receive(:score) {300}
      12.times {game.roll(10)}
      expect(game.total_score).to eq 300
    end
  end

  context 'random game scores correctly' do
    it 'Scores 97 across full game' do
      # allow(frame).to receive(:in_play) {true}
      # allow(frame).to receive(:knocked)
      # allow(frame).to receive(:score) {97}
      game.roll(1)
      game.roll(5)
      game.roll(5)
      game.roll(5)
      game.roll(10)
      game.roll(1)
      game.roll(1)
      game.roll(8)
      game.roll(0)
      4.times {game.roll(3)}
      game.roll(10)
      game.roll(9)
      game.roll(0)
      game.roll(7)
      game.roll(2)
      expect(game.total_score).to eq 97
    end
  end
end
