require 'scorecard'

describe Scorecard do
  
  context 'adding a score' do
    it 'takes a score and adds it to total' do
      subject.add_score(5)

      expect(subject.current_score).to eq 5
    end

    it 'can tell the current roll number' do
      subject.add_score(5)
      subject.add_score(5)

      expect(subject.current_roll).to eq 2
    end
  end

  context 'understanding frames' do
    it 'can tell me the current frame number' do
      subject.add_score(5)

      expect(subject.frame?).to eq 1

    end
    
    it 'knows that there are a max two rolls per frame' do
      subject.add_score(5)
      subject.add_score(5)
      subject.add_score(5)

      expect(subject.frame?).to eq 2
    end
  end
end

