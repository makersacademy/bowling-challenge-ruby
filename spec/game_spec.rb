# frozen_string_literal: true

require 'game'

describe Game do
  subject { described_class.new }

  let(:bowl_double) { double(:bowl, pins: 4) }
  let(:bowl_class_double) { double(:bowl_class, new: :bowl_double) }

  # let(:frame_double) { double () }
  # let(:frame_class_double) { double(:frame_class, :new => :frame_double) }

  describe '#add_bowl' do
    it 'adds the result of a bowl to the game' do
      expect { subject.add_bowl(pins: 5) }.to change { subject.frames.length }.by 1
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

  describe '#state' do
    it 'a new game starts on the first bowl of the first frame' do
      expect { subject.state }
        .to output { 'Current Frame: 1; Current Bowl: 1' }.to_stdout
    end

    it 'tracks an increment to the current bowl' do
      subject.add_bowl(pins: 4)

      expect { subject.state }
        .to output { 'Current Frame: 1; Current Bowl: 2' }.to_stdout
    end

    it 'tracks an increment to the current frame' do
      2.times { subject.add_bowl(pins: 4) }

      expect { subject.state }
        .to output { 'Current Frame: 2; Current Bowl: 1' }.to_stdout
    end

    it 'increments the frame by one if there is a strike' do
      subject.add_bowl(pins: 10)

      expect { subject.state }
        .to output { 'Current Frame: 2; Current Bowl: 1' }.to_stdout
    end
  end

  describe '#frames' do
    it 'stores the frames that have been played' do
      5.times { subject.add_bowl(pins: 4) }

      expect(subject.frames).to be_a Array
      expect(subject.frames.length).to eq 3
    end
  end
end
