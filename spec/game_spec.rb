# frozen_string_literal: true

require 'game'

describe Game do
  describe '#score' do
    it 'returns the total score' do
      frame1 = double('frame1', score: 1)
      frame2 = double('frame2', score: 2)
      subject.frames << frame1
      subject.frames << frame2
      expect(subject.score).to eq(3)
    end
  end

  describe '#play' do
    it 'plays 10 rounds' do
      allow(subject).to receive(:gets).and_return('1')
      subject.play
      expect(subject.frames.length).to eq(Game::MAX_FRAMES)
    end

    it 'takes user input for a score and records it' do
      allow(subject).to receive(:gets).and_return('1')
      subject.play
      expect(subject.score).to eq(20)
    end

    it 'can record a perfect game' do
      allow(subject).to receive(:gets).and_return('10')
      subject.play
      expect(subject.score).to eq(300)
    end
  end
end
