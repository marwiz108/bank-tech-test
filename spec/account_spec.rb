require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:amount) { 500 }

  it 'can create a bank account' do
    expect(account.balance).to eq(0)
  end

  it 'can deposit money' do
    expect { account.deposit(amount) }.to change { account.balance }.by(amount)
  end

  it 'can withdraw money' do
    account.deposit(amount)
    expect { account.withdraw(amount) }.to change { account.balance }.by(-amount)
  end

  it 'does not allow withdrawals if balance is less than withdrawal amount' do
    error_message = "You do not have sufficient funds to withdraw £#{amount}."
    expect { account.withdraw(amount) }.to raise_error NoBalanceError, error_message
  end
end
