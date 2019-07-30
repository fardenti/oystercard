require "oystercard"

describe Oystercard do
  it 'has a balance of nil' do
    expect(subject.balance).to eq 0
  end
  it 'has top up functionality' do
    expect(subject).to respond_to(:top_up)
  end

  describe '#top_up' do
    it 'top up can receive amount' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'can top up card with amount of 5' do
      expect{subject.top_up(5)}.to change {subject.balance}.by 5
    end
  end
end
