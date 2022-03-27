require 'scorecard.rb'

describe Scorecard do

  context 'setup' do

    it 'should initialise with a default array of frames' do
      card = Scorecard.new
      expect(card.frames.length).to eq 1
    end

    it 'should return the current frame' do
      card = Scorecard.new
      expect(card.turn).to eq 0
    end

  end

  context 'logging a roll' do

    let(:frame_double) { double(:frame_double, :rolled => 7, :score => 7, :next_turn? => false) }
  
    it 'should respond to logging a roll with 1 argument' do
      expect(subject).to respond_to(:roll).with(1).argument
    end

    it 'should pass the roll to a frame' do
      card = Scorecard.new(frame_double)
      card.roll(6)
      expect(card.frames[0].score).to eq 7
    end

    context 'frame complete' do

      let(:complete_frame_double) { double(:frame_double, :next_turn? => true, :score => 7, ) }

      before do
        @card = Scorecard.new(complete_frame_double)
      end

      it 'should update total score when complete' do
        expect { @card.roll(3) }.to change { @card.total_score }.from(0).to(7)
      end

      it 'should start a new frame when the previous is complete' do
        expect { @card.roll(3) }.to change { @card.frames.length }.by 1
      end

    end

  end 