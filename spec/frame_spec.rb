require 'frame'

describe Frame do
  let(:roll_1) { instance_double(Roll) }
  let(:roll_2) { instance_double(Roll) }
  subject { described_class.new(roll_1, roll_2) }

  context 'the default frame' do
    before do
      allow(roll_1).to receive(:pins=).with(0).and_return(0)
      allow(roll_1).to receive(:pins).and_return(0)
      allow(roll_2).to receive(:pins=).with(0).and_return(0)
      allow(roll_2).to receive(:pins).and_return(0)
    end

    it { is_expected.to have_attributes(pins: 10) }

    it { is_expected.to respond_to(:roll_1) }

    it { is_expected.to respond_to(:roll_2) }
  end

end
