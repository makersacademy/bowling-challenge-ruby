require_relative '../../app'

RSpec.describe Application do
    context 'runs application controller' do
        it 'returns first roll' do
            score_entry = ScoreEntry.new(1, 5)
            score_entry1 = ScoreEntry.new(2, 2)
            
            entry = score_entry.score
            entry1 = score_entry1.score
            score_card = ScoreCard.new
            
            score_card.frame_score_array(entry)
            score_card.frame_score_array(entry1)
            score_card.score_card
            result = score_card.print_total_score
            
            score_total = ScoreTotal.new

            score_total.strike_score(result)
            score_total.spare_score

            expect(score_total.total_score).to eq 7
            expect(score_total.print_score_card).to eq [[5, 2]]
        end
    end
end




