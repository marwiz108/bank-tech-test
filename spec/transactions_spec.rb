require 'transactions'

describe Transactions do
  subject(:transactions) { described_class.new }
  let(:amount) { 500 }
  let(:date) { Time.new.strftime('%d/%m/%Y') }

  it 'stores deposits as credit transactions' do
    transactions.credit(100)
    transactions.credit(200)
    expect(transactions.rows).to eq([
                                      [date, 100, '-', 100],
                                      [date, 200, '-', 300]
                                    ])
  end
end
