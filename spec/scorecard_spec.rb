require 'scorecard'

describe Scorecard do

    context 'Looking at the methods involved' do
        
        it 'expects scorecard to have the method game' do
            expect(subject).to respond_to(:game)
        end

        it 'will call the class Round when the round count is under 9' do

        end

        it 'will call the class Last Round when the round count is 9' do

        end

    end
end