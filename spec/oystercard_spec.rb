require "oystercard"

describe Oystercard do
  it 'has balance functionality' do
    expect(subject).to respond_to :balance
  end
  it 'has a balance of nil' do
    expect(subject.balance).to eq 0
  end
  it 'has top up functionality' do
    expect(subject).to respond_to(:top_up)
  end
  it 'has deduct functionality' do
    expect(subject).to respond_to :deduct
  end
  it 'has a "in journey" status' do
    expect(subject).to respond_to :in_journey
  end
  it 'has in journey functionality' do
    expect(subject).to respond_to :in_journey?
  end
  it 'starts off with in_journey being false' do
    expect(subject.in_journey).to eq false
  end
  it 'has in touch in functionality' do
    expect(subject).to respond_to :touch_in
  end
  it 'has in touch out functionality' do
    expect(subject).to respond_to :touch_out
  end

  context '#journey status' do
    describe '#touch_in' do
      it 'when card touched in, journey starts' do
        subject.top_up(5)
        subject.touch_in
        expect(subject).to be_in_journey
      end
      it 'when card touched out, journey ends' do
        subject.top_up(5)
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
      it 'raises error when touch in if balance below MIN_VALUE' do
        expect(subject.balance).to eq 0
        expect {subject.touch_in}.to raise_error 'Your card balance is below £1, please top up'
      end
      it 'raises error when touch out if journey hasnt started yet' do
        expect(subject.in_journey).to eq false
        expect{subject.touch_out}.to raise_error 'you havent started your journey yet, please touch in card to start journey'
      end
    end
  end

  describe '#top_up' do
    it 'top up can receive amount' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'can top up the balance of card with amount of £5' do
      expect{subject.top_up(5)}.to change {subject.balance}.by 5
    end
    it 'raises error if topping up results in exceeding the balance limit of £90' do
      max_limit = Oystercard::MAX_VALUE
      subject.top_up(max_limit)
      expect { subject.top_up 1 }.to raise_error 'top up amount has exceeded limit of £90'
    end
  end

  describe '#deduct' do
    it 'deduct can receive an amount to deduct' do
      expect(subject).to respond_to(:deduct).with(1).argument
    end
    it 'deducts amount from balance' do
      expect { subject.deduct 5 }.to change { subject.balance }.by -5
    end
  end

end
