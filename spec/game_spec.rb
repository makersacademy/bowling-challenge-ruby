require_relative '../lib/game'

describe Game do
    it 'adds frame_score to the tally if frame_score less than 10' do
    
    end

    it 'empties rolls once two balls have been rolled' do
        subject.input_roll(1)
        subject.input_roll(1)
        expect(subject.rolls).to eq 0
    end
end

