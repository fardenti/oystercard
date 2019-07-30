require './lib/oystercard'

oystercard = Oystercard.new
oystercard.top_up(5)
oystercard.top_up(91) #expect to fail
