require "journey"

describe Journey do

  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }
  
  describe "#start" do

    it "stores the entry station" do
      subject.start(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

  end

  describe "#finish" do

    it "stores the exit station" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

  end

  describe "#fare" do

    it "returns the fare of the journey" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.fare).to eq 2
    end

  end

  describe "complete?" do

    it "returns true when complete" do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject).to be_complete
    end

    it "returns false when no #entry_station" do
      subject.finish(exit_station)
      expect(subject).not_to be_complete
    end

    it "returns false when no #exit_station" do
      subject.start(entry_station)
      expect(subject).not_to be_complete
    end

  end

end