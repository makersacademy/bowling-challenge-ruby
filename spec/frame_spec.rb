require_relative '../lib/frame'

describe Frame do
    it 'allows a player to input each of their rolls' do
        subject.input_roll(9)
        expect(subject.rolls).to eq [9]
    end
    
    it 'registers strike if first roll equals 10' do
        subject.input_roll(10)
        expect(subject.strike?).to eq true
    end

    it 'does not register strike if first roll equals 10' do
        subject.input_roll(9)
        expect(subject.strike?).to eq false
    end

    it 'does not register spare if first roll + second roll are less than 10' do
        subject.input_roll(7)
        subject.input_roll(1)
        expect(subject.spare?).to eq false
    end

    it 'registers spare if first roll + second roll equal 10' do
        subject.input_roll(9)
        subject.input_roll(1)
        expect(subject.spare?).to eq true
    end    

    xit 'does not allow a player to enter a roll higher than ten' do
    end

    xit 'does not allow a player to enter a second roll higher than the ten minus their first roll' do
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