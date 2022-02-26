# frozen_string_literal: true

require 'game'

PERFECT_SCORE = 300
HIGHEST_NO_STRIKES = 190

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

    it 'can record a perfect game (multiple strikes in a row)' do
      allow(subject).to receive(:gets).and_return('10')
      subject.play
      expect(subject.score).to eq(PERFECT_SCORE)
    end

    it 'can record multiple spares in a row' do
      allow(subject).to receive(:gets).and_return('9', '1', '9', '1', '9', '1', '9', '1', '9', '1', '9', '1', '9', '1',
                                                  '9', '1', '9', '1', '9', '1', '9')
      subject.play
      expect(subject.score).to eq(HIGHEST_NO_STRIKES)
    end
  end
end
