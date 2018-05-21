require 'account'

describe Account do
  subject(:account) { described_class.new }

  it 'can create a bank account' do
    expect(account.balance).to eq(0)
  end
end
