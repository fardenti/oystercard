require_relative './journey.rb'

class Oystercard

  attr_reader :balance, :entry_station, :journey_history, :current_journey
  MAX_VALUE = 90
  MIN_VALUE = 1
  PENALTY_FARE = 8

  def initialize(journey_class = Journey)
    @balance = 0
    @journey_history = [] #array created to store journey history
    @current_journey = nil
    @journey_class = journey_class
  end

  def top_up(amount)
    fail "top up amount has exceeded limit of £#{MAX_VALUE}" if (@balance + amount) > MAX_VALUE
    @balance += amount
  end

  def in_journey?
   !!@current_journey #returns true when journey has started
  end

  def touch_in(station)
    balance_check
    touch_in_check
    @current_journey = @journey_class.new
    @current_journey.start(station) 
  end
  
  def touch_out(station)
    touch_out_check
    @current_journey.finish(station)
    @journey_history << @current_journey #pushing the current journy thats completed to journey history array
    @current_journey = nil #setting the current jounry back to nothing again
    # p @journey_history
    # p "-----------"
  end



  private

  def deduct(amount)
    @balance -= amount
  end

  def touch_in_check
    if in_journey? == true
      #fail "you touched in twice and now charged a penatly fare of #{PENALTY_FARE}"
      deduct(PENALTY_FARE) 
      @journey_history << @current_journey
    end
  end

  def touch_out_check
    if in_journey? == false
      #fail "you didnt touch in at start of journey and now charged a penatly fare of #{PENALTY_FARE}"
      deduct(PENALTY_FARE)
      puts "You touched out without starting a journey, card charged £#{PENALTY_FARE}"
      @current_journey = @journey_class.new
    else
      deduct(@current_journey.fare)
      in_journey? == false #might not need this
    end
  end

  def balance_check
    fail "Your card balance is below £#{MIN_VALUE}, please top up" if @balance < MIN_VALUE
  end

end
