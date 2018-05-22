require 'terminal-table'

class Transactions
  attr_reader :rows, :balance

  def initialize
    @balance = 0
    @rows = []
  end

  def credit(amount)
    rows << [Time.new.strftime('%d/%m/%Y'), amount, '-', @balance += amount]
  end

  def debit(amount)
    rows << [Time.new.strftime('%d/%m/%Y'), '-', amount, @balance -= amount]
  end
end
