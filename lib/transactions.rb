require 'terminal-table'

class Transactions
  attr_reader :rows, :balance

  def initialize
    @rows = []
  end

  def credit(balance, amount)
    rows.unshift([Time.new.strftime('%d/%m/%Y'), amount, '-', balance])
  end

  def debit(balance, amount)
    rows.unshift([Time.new.strftime('%d/%m/%Y'), '-', amount, balance])
  end
end
