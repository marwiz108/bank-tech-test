require_relative 'transactions'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Transactions.new
  end

  def deposit(amount)
    transactions.credit(amount)
    @balance += amount
  end

  def withdraw(amount)
    error_message = "You do not have sufficient funds to withdraw £#{amount}."
    raise NoBalanceError, error_message unless balance >= amount
    @transactions.debit(amount)
    @balance -= amount
  end

  def print_statement
    @transactions.show_table
  end
end

class NoBalanceError < StandardError; end
