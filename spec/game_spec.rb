require 'game'

describe Game do
  subject { described_class.new }

  let(:bowl_double) { double(:bowl, :pins => 4) }
  let(:bowl_class_double) { double(:bowl_class, :new => :bowl_double) }
  
  # let(:frame_double) { double () }
  # let(:frame_class_double) { double(:frame_class, :new => :frame_double) }

  describe '#state' do
    it 'a new game starts on the first bowl of the first frame' do
      expect{ subject.state }.to output { "Current Frame: 1; Current Bowl: 1" }.to_stdout
    end

    it 'tracks an increment to the current bowl' do
      subject.add_bowl(pins: 4)
      
      expect{ subject.state }.to output { 'Current Frame: 1; Current Bowl: 2' }.to_stdout
    end

    it 'tracks an increment to the current frame' do
      subject.add_bowl(pins: 4)

      expect{ subject.state }.to output { 'Current Frame: 2; Current Bowl: 1' }.to_stdout
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