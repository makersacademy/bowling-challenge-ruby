require 'score'

describe Score do

  describe '#calculate' do
    it 'Adds score of the total frame' do
      expect { subject.calculate([3, 4]) }.to change { subject.scores }.from([]).to([7])
    end
  end
  
end
