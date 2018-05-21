require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:amount) { 500 }

  it 'can create a bank account' do
    expect(account.balance).to eq(0)
  end

  it 'can deposit money' do
    expect{ account.deposit(amount) }.to change { account.balance }.by(amount)
  end
end
