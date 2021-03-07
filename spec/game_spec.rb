# frozen_string_literal: true

require 'game'

describe Game do
  subject { described_class.new }

  let(:bowl_double) { double(:bowl, pins: 4) }
  let(:bowl_class_double) { double(:bowl_class, new: :bowl_double) }

  describe '#add_bowl' do
    it 'adds the result of a bowl to the game' do
      expect { 2.times { subject.add_bowl(pins: 4) } }.to change { subject.frames.length }.by 1
    end

    it 'will not let a user enter invalid scores' do
      expect { subject.add_bowl(pins: -4) }
        .to raise_error('Your score must be between 0 and 10')
      expect { subject.add_bowl(pins: 25) }
        .to raise_error('Your score must be between 0 and 10')
    end

    it 'will not allow frame total to exceed 10' do
      subject.add_bowl(pins: 7)

      expect { subject.add_bowl(pins: 6) }
        .to raise_error('Your total score for the frame cannot exceed 10; please check your scores')
    end
  end

  describe '#frames' do
    it 'stores the frames that have been played' do
      6.times { subject.add_bowl(pins: 4) }

      expect(subject.frames).to be_a Array
      expect(subject.frames.length).to eq 3
    end
  end
end
