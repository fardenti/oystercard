class Oystercard

  MAX_VALUE = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end
  def top_up(amount)
    fail "top up amount has exceeded limit of £#{MAX_VALUE}" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end
  def deduct(amount)
    @balance -= amount
  end

end
