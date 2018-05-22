require 'terminal-table'

class Transactions
  attr_reader :rows, :balance

  def initialize
    @balance = 0
    @rows = []
  end

  def credit(amount)
    rows.unshift([Time.new.strftime('%d/%m/%Y'), amount, '-', @balance += amount])
  end

  def debit(amount)
    rows.unshift([Time.new.strftime('%d/%m/%Y'), '-', amount, @balance -= amount])
  end

  def show_table
    @table = Terminal::Table.new do |t|
      t.title = 'Account Statement'
      t.headings = ['Date', 'Credit', 'Debit', 'Balance']
      t.rows = @rows
    end
    print @table
  end
end
