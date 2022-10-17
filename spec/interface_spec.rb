require_relative '../lib/interface'
require_relative 'spec_helper'

RSpec.describe Interface do
  context 'when started' do
    it 'shows the base UI' do
      terminal = double :terminal
      print_ui

      puts?("Bowling is fun apparently! let's begin:").ordered
      puts?("1. New Game").ordered
      puts?("2. Reprint Scores").ordered
      puts?("3. Quit").ordered
    end
  end
end

def puts?(text)
  expect(terminal).to receive(:puts).with(text)
end

def gets?(text)
  expect(terminal).to receive(:gets).with(text)
end