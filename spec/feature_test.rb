require './lib/oystercard'

card = Oystercard.new
puts "your balance is £#{card.balance}"

card.top_up(5)
puts "your balance is £#{card.balance} after top up"

card.touch_in("entry station")
puts "your balance is £#{card.balance} after touch in"
puts "journey started? #{card.in_journey?}"
puts "current journey is: #{card.current_journey}"
puts "journey history is: #{card.journey_history}"

card.touch_in("entry station")
puts "your balance is now £#{card.balance} after touch in twice before ending the first journey"
puts "journey started? #{card.in_journey?}"
puts "current journey is: #{card.current_journey}"
puts "journey history is: #{card.journey_history}"

card.touch_out("exit station")
puts "after journy completed, journey history is now: #{card.journey_history}"
puts "current journey is set to: #{card.current_journey}"
puts "your balance is £#{card.balance}"


#card.touch_out("exit station") #expecting to raise error and charge card penalty fare
#puts "your balance is now £#{card.balance} after touch out without touch in" #expecting to get the deducted balance after penalty