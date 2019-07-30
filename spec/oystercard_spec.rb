require "oystercard"

describe Oystercard do
  it 'has a balance of nil' do
    expect(subject.balance).to eq 0
  end
  it 'has top up functionality' do
    expect(subject).to respond_to(:top_up)
  end
  it 'starts off with in_journey being false' do
    expect(subject.in_journey).to eq false
  end

  it 'when card touched in, journey starts' do
    subject.touch_in
    expect(subject).to be_in_journey
  end
  it 'when card touched out, journey ends' do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  describe '#top_up' do
    it 'top up can receive amount' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'can top up card with amount of £5' do
      expect{subject.top_up(5)}.to change {subject.balance}.by 5
    end

    it 'failes if top up amount is more than £90' do
      expect{subject.top_up(91)}.to raise_error 'top up amount has exceeded limit of £90'
    end
  end

  describe '#deduct' do
    it 'deduct can receive an amount to deduct' do
      expect(subject).to respond_to(:deduct).with(1).argument
    end
    it 'can top up card with amount of £5' do
      expect{subject.deduct(5)}.to change {subject.balance}.by -5
    end
  end

end
