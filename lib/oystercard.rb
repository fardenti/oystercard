class Oystercard

  attr_reader :balance, :in_journey
  MAX_VALUE = 90
  MIN_VALUE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end
  def top_up(amount)
    fail "top up amount has exceeded limit of £#{MAX_VALUE}" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end
  def in_journey?
    @in_journey # returns true / false
  end
  def touch_in
    fail "Your card balance is below £#{MIN_VALUE}, please top up" if @balance < MIN_VALUE
    @in_journey = true
  end
  def touch_out
    fail 'you havent started your journey yet, please touch in card to start journey' if @in_journey == false
    @in_journey = false
  end

end
