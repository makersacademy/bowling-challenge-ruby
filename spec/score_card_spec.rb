require 'score_card'

RSpec.describe ScoreCard do

    context 'creates array for the frame' do
        it 'combines roll one & two' do
            repo = ScoreCard.new

            repo.frame_score_array(5)
            expect(repo.frame_score_array(5)).to eq [5, 5]
        end
    end

    context 'Clears the frame score array' do
        it 'returns empty array of arrays' do
            repo = ScoreCard.new

            repo.frame_score_array(0)
            repo.frame_score_array(10)
            repo.score_card
            expect(repo.score_card).to eq [] # EMPTY
        end
    end

    context 'Keeps games history in array of frame score arrays' do
        it 'returns score card array of arrays with spare' do
            repo = ScoreCard.new

            repo.frame_score_array(0)
            repo.frame_score_array(10)
            repo.score_card
            expect(repo.print_total_score).to eq [[0, 10]] # SPARE
        end

        it 'returns score card array of arrays with strike' do
            repo = ScoreCard.new

            repo.frame_score_array(10)
            repo.score_card
            expect(repo.print_total_score).to eq [[10]] # strike
        end

        it 'returns score card array of arrays for 2 frames' do
            repo = ScoreCard.new

            repo.frame_score_array(5)
            repo.frame_score_array(5)
            repo.score_card
            repo.frame_score_array(10)
            repo.score_card
            expect(repo.print_total_score).to eq [[5, 5], [10]] # Frame 1 & Frame 2
        end
    end

    context 'Keeps a check of the current frame' do
        it 'returns frame true' do
            repo = ScoreCard.new

            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter
            repo.frames_counter

            expect(repo.frames_counter).to eq false 
        end
    end
end
