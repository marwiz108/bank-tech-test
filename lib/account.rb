class Account
  attr_reader :balance

  def initialize
    @balance = Balance.new.start_balance #is this good practice?
  end
end
