require 'transactions'

describe Transactions do
  subject(:transactions) { described_class.new }
  let(:amount) { 500 }
  let(:date) { Time.new.strftime('%d/%m/%Y') }

  it 'stores deposits as credit transactions' do
    transactions.credit(100)
    transactions.credit(200)
    expect(transactions.rows).to eq([
                                      [date, 200, '-', 300],
                                      [date, 100, '-', 100]
                                    ])
  end

  it 'stores withdrawals as debit transactions' do
    transactions.credit(amount)
    transactions.debit(100)
    transactions.debit(200)
    expect(transactions.rows).to eq([
                                      [date, '-', 200, 200],
                                      [date, '-', 100, 400],
                                      [date, amount, '-', 500]
                                    ])
  end

  it 'shows the table of transactions' do
    expect(transactions.show_table).to be nil
  end
end
