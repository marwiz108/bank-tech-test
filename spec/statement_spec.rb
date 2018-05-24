require 'statement'

describe Statement do
  subject(:statement) { described_class.new(rows) }
  let(:rows) { Account.new.transactions.rows }
  it 'stores transactions in a table' do
    expect { statement.show_table }.to output(
      "+------+--------+-------+---------+\n" \
      "|        Account Statement        |\n" \
      "+------+--------+-------+---------+\n" \
      "| Date | Credit | Debit | Balance |\n" \
      "+------+--------+-------+---------+\n" \
      "+------+--------+-------+---------+\n"
    ).to_stdout
  end
end
