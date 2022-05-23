require_relative '../lib/final_frame'

describe FinalFrame do

    it 'does not allow the player to roll more than three balls' do
        subject.input_roll(8)
        subject.input_roll(2)
        subject.input_roll(8)
        expect(subject.game_over).to include ('game over')
    end

    it 'gives the player an extra roll if they score a strike or a spare' do
        subject.input_roll(10)
        subject.input_roll(2)
        expect(subject.complete?).not_to eq true
    end

    it 'only gives the player two rolls if they do not get a spare or a strike' do
    subject.input_roll(2)
    subject.input_roll(2)
    expect(subject.complete?).to eq true
    end
end