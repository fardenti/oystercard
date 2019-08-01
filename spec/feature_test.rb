require './lib/oystercard'

oystercard = Oystercard.new
puts "your balance is #{oystercard.balance}"
oystercard.top_up(5)
puts "your balance is #{oystercard.balance}"
oystercard.touch_in("entry station")
puts "your balance is #{oystercard.balance}"
oystercard.touch_out("exit station")
p oystercard.journey_history
puts "your balance is #{oystercard.balance}"
oystercard.touch_out("exit station")
puts "your balance is #{oystercard.balance}"