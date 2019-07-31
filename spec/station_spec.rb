require 'station'

describe Station do
    let(:zone) {double(:two)}
    let(:name) {double(:charing_cross)}
    subject {Station.new(name, zone)}
    it { is_expected.to respond_to(:zone, :name) }
end