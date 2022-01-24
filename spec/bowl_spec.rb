require 'bowl'

describe Bowl do
    let(:bowl) {described_class.new}

    it 'the 1st roll equal to 4' do
        bowl.first_roll(4)
        expect(bowl.rolls[0][:roll_one]).to eq 4
    end 

    it 'the 2nd roll equal to 3' do
        bowl.second_roll(3)
        expect(bowl.rolls[0][:roll_two]).to eq 3
    end

    it 'calculates the total roll' do
        bowl.first_roll(4)
        bowl.second_roll(3)
        expect(bowl.rolls[0][:total_roll]).to eq 7
    end 

end 