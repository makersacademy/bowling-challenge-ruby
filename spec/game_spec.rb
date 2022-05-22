require_relative '../lib/game'

describe Game do
    it 'adds frame_score to the tally if frame_score less than 10' do
        subject.roll(8)        
        expect{subject.roll(1)}.to change {subject.tally}
    end

    #now test what happens to the tally if you get a spare or a strike...

    it 'does not add frame to frame_score if it equals 10' do
        subject.roll(8)
        subject.roll(2)
        expect(subject.frame_score).to eq 0
    end

    it 'adds frame to frame_score if it equals less than 10' do
        subject.roll(8)
        subject.roll(1)
        expect(subject.frame_score).to eq 9
    end

    it 'instantiates a new frame after each frame' do
        frame_one = subject.frame
        subject.roll(8)
        subject.roll(1)
        expect(subject.frame).not_to eq frame_one
    end

    # xit 'switches to FinalFrame after the 9th frame' do
    #     9.times {subject.roll(10)}
    #     subject.roll(5)
    #     subject.roll(3)
    #     expect.subject.
    # end



    # it 'empties rolls once two balls have been rolled' do
    #     subject.input_roll(1)
    #     subject.input_roll(1)
    #     subject.input_roll(1)
    #     expect(subject.rolls).to eq [1]
    # end
end

