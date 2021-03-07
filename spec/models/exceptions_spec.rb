describe PinError do
  it 'raises pin error with custom message' do
    expect { raise described_class }.to raise_error described_class, subject.msg
  end
end

describe GameOverError do
  it 'raises game over error with custom message' do
    expect { raise described_class }.to raise_error described_class, subject.msg
  end
end
