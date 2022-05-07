require 'scorecard.rb'

describe Scorecard do

    context 'frame complete' do
      let(:complete_frame_double) { double(:frame_double, :next_turn? => true, :score => 7, :strike? => false, :bonus_score => 0, :spare? => false) }

      before do
        @card = Scorecard.new(complete_frame_double)
      end

      it 'should update total score' do
        expect { @card.calculate_total }.to change { @card.total_score }.from(0).to(7)
      end

      it 'should start a new frame when the previous is complete' do
        expect { @card.roll(3) }.to change { @card.frames.length }.by 1
      end

    end
  end 

  context 'calculating a bonus' do

    it 'should increase the total score by the bonus' do
        card = Scorecard.new
        card.roll(3)
        card.roll(7) 
        expect(card.total_score).to eq 10
        card.roll(4)
        card.roll(1)
        expect(card.total_score).to eq 19
    end

    it 'should increase the total score by the bonus' do
      card = Scorecard.new
        card.roll(10)
        expect(card.total_score).to eq 10
        card.roll(6)
        expect(card.total_score).to eq 22
    end
end