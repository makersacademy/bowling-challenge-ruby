require 'score'

describe Score do 
    context 'counts the score' do
        it 'the sum of inputs is less than 10' do
            first_score = Score.new(1,4)
            expect(first_score.count).to eq 5
        end

        it 'the sum of inputs equal to 10' do 
            score = Score.new(10,0)
            expect(score.count).to eq 10
        end
    end

    context 'user input is a spare' do
        it 'the sum of inputs is equal to 10' do 
            score = Score.new(5,5)
            expect(score.count).to eq 10
            expect(score.spare(2)).to eq 12
        end
    end

    context 'user input is a strike' do
        it 'the first input is equal to 10' do
            score = Score.new(10,0)
            expect(score.count).to eq 10
            expect(score.strike(4,2)).to eq 16
        end
    end
end