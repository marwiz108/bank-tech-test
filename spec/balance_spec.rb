require 'balance'

describe Balance do
  subject(:balance) { described_class.new }

  it 'starts at zero' do
    expect(balance.start_balance).to eq 0
  end
end
