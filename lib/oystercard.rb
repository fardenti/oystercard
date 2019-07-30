class Oystercard

  MAX_VALUE = 90
  attr_reader :balance, :in_journey

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
    @in_journey = true
  end
  def touch_out
    @in_journey = false
  end

end
