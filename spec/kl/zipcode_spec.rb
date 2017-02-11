require "spec_helper"

describe Kl::Zipcode do
  let(:zipcode) { Kl::Zipcode['94108'] }
  it "#county" do
    expect(zipcode.county).to eq('SAN FRANCISCO')
  end
  it '#city' do
    expect(zipcode.city).to eq('SAN FRANCISCO')
  end
  it '#state' do
    expect(zipcode.state).to eq('CA')
  end
  it '#to_hash' do
    expect(zipcode.to_hash).to eq({ :city => "SAN FRANCISCO", :state => "CA", :county => "SAN FRANCISCO" })
  end
end
