require 'score_total'

RSpec.describe ScoreTotal do
    context 'calculates the score after a stike' do 
        it 'returns strike frame after next frame' do
            repo = ScoreTotal.new
            
            expect(repo.strike_score([[10],[5, 2]])).to eq [[17], [5, 2]]
        end

        it 'returns 30 after after next frame strike' do
            repo = ScoreTotal.new
            
            expect(repo.strike_score([[10],[5, 2],[10],[10]])).to eq [[17], [5, 2], [30], [10]]
        end

        it 'returns 30 after after next frame strike' do
            repo = ScoreTotal.new
            
            expect(repo.strike_score([[10],[5, 2],[10],[10],[0,0],[10],[9, 1],[10]])).to eq [[17], [5, 2], [30], [10], [0, 0], [20], [9, 1], [10]]
        end
    end

    context 'calculates the score after a spare' do 
        it 'returns spare frame after next frame' do
            repo = ScoreTotal.new
            repo.strike_score([[10],[5, 2]])
            expect(repo.spare_score).to eq [[17], [5, 2]]
        end

        it 'returns 20 after after next frame spare' do
            repo = ScoreTotal.new
            repo.strike_score([[10],[5, 2],[10],[10]])
            expect(repo.spare_score).to eq [[17], [5, 2], [30], [10]]
        end

        it 'returns 30 after after next frame spare' do
            repo = ScoreTotal.new
            repo.strike_score([[10],[5, 2],[10],[10],[0,0],[10],[9, 1],[10]])
            expect(repo.spare_score).to eq [[17], [5, 2], [30], [10], [0, 0], [20], [20], [10]]
        end

        it 'returns 30 after after next frame spare' do
            repo = ScoreTotal.new
            repo.strike_score([[10],[5, 5],[5, 0],[10],[0,0],[10],[9, 1],[10]])
            expect(repo.spare_score).to eq [[20], [15], [5, 0], [10], [0, 0], [20], [20], [10]]
        end
    end

    context 'calculates the total score' do 
        it 'returns total' do
            repo = ScoreTotal.new
            repo.strike_score([[10],[5, 2],[10],[10],[0,0],[10],[9, 1],[10]])
            repo.spare_score
            expect(repo.total_score).to eq 114
        end
    end

    context 'prints score card' do 
        it 'returns score card' do
            repo = ScoreTotal.new
            repo.strike_score([[10],[5, 2],[10],[10],[0,0],[10],[9, 1],[10]])
            repo.spare_score
            expect(repo.print_score_card).to eq [[17], [5, 2], [30], [10], [0, 0], [20], [20], [10]]
        end
    end
end



