require 'account'
require 'terminal-table'

describe Account do
  subject(:account) { described_class.new }
  let(:amount) { 500 }
  let(:date) { Time.new.strftime('%d/%m/%Y') }

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

  it 'stores deposits and withdrawals as transactions' do
    account.deposit(amount)
    account.withdraw(amount)
    expect(account.transactions.rows).to eq([
                                              [date, '-', amount, 0],
                                              [date, amount, '-', amount]
                                            ])
  end

  it 'prints the account statement as a table' do
    account.deposit(200)
    account.deposit(100)
    account.withdraw(150)
    expect { account.print_statement }.to output(
      "+------------+--------+-------+---------+\n" \
      "|           Account Statement           |\n" \
      "+------------+--------+-------+---------+\n" \
      "| Date       | Credit | Debit | Balance |\n" \
      "+------------+--------+-------+---------+\n" \
      "| #{date} | -      | 150   | 150     |\n" \
      "| #{date} | 100    | -     | 300     |\n" \
      "| #{date} | 200    | -     | 200     |\n" \
      "+------------+--------+-------+---------+\n"
    ).to_stdout
  end
end
