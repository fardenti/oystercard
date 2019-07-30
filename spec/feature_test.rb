require './lib/oystercard'

oystercard = Oystercard.new
oystercard.top_up(5)
oystercard.deduct(5)
oystercard.touch_in # this should change in_journey? to true
oystercard.touch_out # this should change it back to false

puts oystercard.in_journey?
