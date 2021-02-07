require 'player'

describe Player do
  it { is_expected.to respond_to(:roll)}
  subject { described_class.new }

  describe "roll" do
    before do
      $stdin = StringIO.new("2")
    end

    it 'saves a bowl score' do
      expect(subject.roll).to eq subject.score
    end
  end


end
