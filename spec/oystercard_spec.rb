require "oystercard"

describe Oystercard do
  it 'has a balance of nil' do
    expect(subject.balance).to eq 0
  end
end
