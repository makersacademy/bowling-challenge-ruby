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

    it 'shows 10 frames of [4,4] for 20 consecutive rolls of 4' do
        20.times {subject.roll(4)}
        expect(subject.tally).to eq ([[4, 4], [4, 4], [4, 4], [4, 4], [4, 4], [4, 4], [4, 4], [4, 4], [4, 4], [4,4]])
    end

    it 'if player rolls a strike in frame 1 and a spare in frame 2, the strike should be added at the end of frame 2' do
        subject.roll(10)
        2.times {subject.roll(5)}
        expect(subject.tally).to eq ([[[10], 5, 5], []])
    end

    it 'if player rolls a strike in frame 1, and a spare in frame 2, and neither in frame 3, the strike will be added at the end of frame 2 and the spare at the end of frame 3' do
        subject.roll(10)
        2.times {subject.roll(5)}
        2.times {subject.roll(4)}
        expect(subject.tally).to eq ([[[10], 5, 5], [[5, 5], 4], [4, 4]])
    end



    # xit 'switches to FinalFrame after the 9th frame' do
    #     9.times {subject.roll(10)}
    #     subject.roll(5)
    #     subject.roll(3)
    #     expect.subject.
    # end

end

