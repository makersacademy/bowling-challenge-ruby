require 'score'

describe Score do

    context 'It initializes with an empty array and empty total score' do

        it 'should have an empty array' do
            expect(subject.score_card.length).to eq(0)
        end

        it 'should have a total score which equals 0' do
            expect(subject.total_score).to eq(0)
        end
    end

    context 'Score has to perform a lot of maths' do
        
        it 'adds a normal score to the total score' do

        end

        it 'adds a strike to the total score appropriately' do

        end

        it 'adds a spare to the total score appropriately' do

        end
    end
end