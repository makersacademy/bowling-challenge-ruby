    expect(application('5/458/x 0/x 62x 4/xx ')).to eq 169

    expect(application('5/4081x 0/x x x 4/xx5')).to eq 186

    expect(application('627234/9  x x x638/7')).to eq 153

    expect(application('x x x x x x x x x xxx')).to eq 300
