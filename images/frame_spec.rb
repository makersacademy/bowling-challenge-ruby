require 'frame'

describe Frame do 
  context 'when strike' do 
    subject { described_class.new(10, 0) }
    it 'knows if it #is_strike?' do 
      expect(subject.is_strike?).to eq true    
    end 
  end

  context 'when spare' do 
    subject { described_class.new(5, 5) }
    it 'knows if it #is_spare?' do 
      expect(subject.is_spare?).to eq true    
    end 
  end
end