require 'score_input'

describe ScoreInput do 
  context 'add_score' do 
    it 'correctly counts a turn lower than 10 points' do
      repo = ScoreInput.new
      response = repo.add_score(7,3)
      # expect(response).to eq "Spare!"
      expect(repo.check_score(0)).to eq(10)
    end

    xit 'inputs a spare on the first turn, 7 on the second' do 
      repo = ScoreInput.new
      turn = repo.add_score(4,6)
      response = turn.add_score(7,0)
      expect(response.check_score(0)).to eq 17
      expect(response.check_score(1)).to eq 24
    end

    it 'inputs a spare on the first turn, 7 on the second (2)' do 
        repo = ScoreInput.new
        repo.add_score(4,6)
        response = repo.add_score(7,0)
        expect(response.check_score(0)).to eq 17
        expect(response.check_score(1)).to eq 24
      end

    xit 'raises error from scoring more more than ten a turn' do 
      repo = ScoreInput.new
      sudo = repo.add_score(6,7)
      expect { sudo }.to raise_error("You can't hit more than 10 pins a turn")
    end
  end
end
