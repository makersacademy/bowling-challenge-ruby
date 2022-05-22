require_relative '../lib/game'

describe Game do
    it 'adds frame_score to the tally if frame_score less than 10' do
        subject.input_roll(8)        
        expect{subject.input_roll(1)}.to change {subject.tally}
    end

    #now test what happens to the tally if you get a spare or a strike...

    it 'does not add frame to frame_score if it equals 10' do
        subject.input_roll(8)
        subject.input_roll(2)
        expect(subject.frame_score).to eq 0
    end

    it 'adds frame to frame_score if it equals less than 10' do
        subject.input_roll(8)
        subject.input_roll(1)
        expect(subject.frame_score).to eq 9
    end

    it 'empties rolls once two balls have been rolled' do
        subject.input_roll(1)
        subject.input_roll(1)
        subject.input_roll(1)
        expect(subject.rolls).to eq [1]
    end
end

