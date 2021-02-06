require 'player'

describe Player do
  it { is_expected.to respond_to(:roll)}

  describe "roll" do
    it 'opens a frame instance' do
      subject.roll
      expect(subject.roll).to eq roll
    end
  end
end
