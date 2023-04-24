require 'score_entry'

RSpec.describe ScoreEntry do
    context 'test the entry scoring system' do
        it 'returns stike if roll one eq 10' do
            repo = ScoreEntry.new(1, 10)
            expect(repo.roll).to eq 1
        end

        it 'returns roll one score' do
            repo = ScoreEntry.new(1, 5)
            expect(repo.score).to eq 5
        end
    end

    context 'test the entry scoring system' do
        it 'returns spare if roll two eq 10' do
            repo = ScoreEntry.new(2, 10)
            expect(repo.roll).to eq 2
        end

        it 'returns roll two score' do
            repo = ScoreEntry.new(2, 5)
            expect(repo.score).to eq 5
        end
    end
end