require_relative 'transactions'

class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = Transactions.new
  end

  def deposit(amount)
    @balance += amount
    transactions.credit(balance, amount)
    "You have credited your account with £#{amount}. Your current balance is now #{balance}."
  end

  def withdraw(amount)
    error_message = "You do not have sufficient funds to withdraw £#{amount}."
    raise NoBalanceError, error_message unless balance >= amount
    @balance -= amount
    transactions.debit(balance, amount)
    "You have debited your account with #{amount}. Your current balance is now #{balance}."
  end

  def print_statement
    # Statement.new.show_table ?
  end
end

class NoBalanceError < StandardError; end
