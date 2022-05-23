require_relative '../lib/game'

describe Game do
    it 'adds frame_score to the tally if frame_score less than 10' do
        subject.roll(8)        
        expect{subject.roll(1)}.to change {subject.tally}
    end

    it 'instantiates a new frame after each frame played' do
        frame_one = subject.frame
        subject.roll(8)
        subject.roll(1)
        expect(subject.frame).not_to eq frame_one
    end

    it 'empties the rolls array once it contains two rolls or has a strike' do
        subject.roll(9)
        subject.roll(0)
        expect(subject.rolls).to eq []
    end

    it 'empties the rolls array once it contains two rolls or has a strike' do
        subject.roll(10)
        expect(subject.rolls).to eq []
    end

    # xit 'switches to FinalFrame after the 9th frame' do
    #     9.times {subject.roll(10)}
    #     subject.roll(5)
    #     subject.roll(3)
    #     expect.subject.
    # end

end

