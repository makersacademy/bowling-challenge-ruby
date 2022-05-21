require_relative '../lib/frame'

describe Frame do
    it 'allows a player to input each of their rolls' do
        subject.input_roll(9)
        expect(subject.rolls).to eq [9]
    end
    
    it 'checks if roll equals less than 10' do
        subject.input_roll(9)
        expect(subject.roll_less_than_ten?).to eq true
    end

    it 'checks if first roll + second roll are less than 10' do
        subject.input_roll(7)
        subject.input_roll(1)
        expect(subject.frame_less_than_ten?).to eq true
    end

    it 'checks if first roll + second roll equal 10' do
        subject.input_roll(9)
        subject.input_roll(1)
        expect(subject.frame_less_than_ten?).to eq false
    end

    it 'adds frame to frame_score if it equals less than 10' do #change description
        expect { subject.input_roll(8) }.to change { subject.frame_score }.by 8
    end

    it 'adds frame to frame_score if it equals less than 10' do
        subject.input_roll(8)
        subject.input_roll(1)
        expect(subject.frame_score).to eq 9
    end

    it 'does not add frame to frame_score if it equals 10' do
        subject.input_roll(8)
        subject.input_roll(2)
        expect(subject.frame_score).to eq 0
    end

    # xit 'does not let the player take a second roll if roll_1 = 10 and frame < 9' do
    # end

    # xit 'adds the score of the subsequent frame to the current frame if roll_1 of current frame == 10' do
    # end

    # xit 'adds the score of the first roll of the subsequent frame to the current frame if roll_1 + roll_2 of current frame == 10' do
    # end

    # xit 'does not allow the player to take more than two rolls on any frame < 9' do
    # end

    # xit 'does not allow the player to take more than three rolls on any frame ever' do
    # end
end