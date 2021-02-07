require './lib/roll'

describe Roll do

    it 'should initialize with an score' do 
        roll = Roll.new(5)
        expect(roll.score).to eq 5
    end
    
end