require_relative 'transactions'

class Statement
  attr_reader :rows, :table

  def initialize(rows)
    @rows = rows
  end

  def show_table
    @table = Terminal::Table.new do |t|
      t.title = 'Account Statement'
      t.headings = ['Date', 'Credit', 'Debit', 'Balance']
      t.rows = rows
    end
    puts @table
  end
end
