require 'transactions'

describe Transactions do
  subject(:transactions) { described_class.new }
  let(:amount) { 500 }
  let(:date) { Time.new.strftime('%d/%m/%Y') }

  it 'stores deposits as credit transactions' do
    transactions.credit(amount, amount)
    transactions.credit(1000, amount)
    expect(transactions.rows).to eq([
                                      [date, 500, '-', 1000],
                                      [date, 500, '-', 500]
                                    ])
  end

  it 'stores withdrawals as debit transactions' do
    transactions.credit(amount, amount)
    transactions.debit(400, 100)
    transactions.debit(200, 200)
    expect(transactions.rows).to eq([
                                      [date, '-', 200, 200],
                                      [date, '-', 100, 400],
                                      [date, 500, '-', 500]
                                    ])
  end
end
