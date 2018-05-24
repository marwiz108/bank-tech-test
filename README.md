# Bank Tech Test

The goal is to create a Bank program that allows the user (account holder) to make basic bank transactions such as deposits and withdrawals. The user should also be able to print a bank statement and see their transaction history. The data of transactions should be kept in memory; it does not need to be stored in a database.

This program is written in Ruby language, using OOD and TDD.

## Criteria

__Given__ a client makes a deposit of 1000 on 10-01-2012  
__And__ a deposit of 2000 on 13-01-2012  
__And__ a withdrawal of 500 on 14-01-2012  
__When__ she prints her bank statement  
__Then__ she would see  

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Installation
This program uses the testing gems `rspec` for feature tests, `simplecov` for test coverage, and `rubocop` for code quality. Other gems that were used are `terminal-table` to create the Account Statement table.

To install the required gems in the terminal:
```
bundle install
```

## Usage
When running the program in a REPL, you need to require the file './lib/account'. Creating a new account can be declared by a new instance of the Account class and assigning it to a variable.
```ruby
$ irb
2.5.0 :001 > require './lib/account'
 => true
2.5.0 :002 > a = Account.new
 => #<Account:0x00007ffe89090508 @balance=0, @transactions=#<Transactions:0x00007ffe89090468 @rows=[]>>
```

You can check your balance at any time by running:
```ruby
2.5.0 :003 > a.balance
 => 0
```

To make a deposit of a sum:
```ruby
2.5.0 :004 > a.deposit(200)
 => "You have credited your account with £200. Your current balance is now 200."
```

To make a withdrawal:
```ruby
2.5.0 :005 > a.withdraw(50)
 => "You have debited your account with 50. Your current balance is now 150."
```

You cannot withdraw an amount over your current balance:
```ruby
2.5.0 :006 > a.withdraw(300)
Traceback (most recent call last):
        3: from /Users/marwaelali/.rvm/rubies/ruby-2.5.0/bin/irb:11:in <main>'
        2: from (irb):6
        1: from /Users/marwaelali/Projects/weekly-challenges/week10/bank-tech-test/lib/account.rb:20:in `withdraw'
NoBalanceError (You do not have sufficient funds to withdraw £300.)
```

To see your transaction history, you can print your Account Statement:
```ruby
2.5.0 :007 > a.print_statement
+------------+--------+-------+---------+
|           Account Statement           |
+------------+--------+-------+---------+
| Date       | Credit | Debit | Balance |
+------------+--------+-------+---------+
| 24/05/2018 | -      | 50    | 150     |
| 24/05/2018 | 200    | -     | 200     |
+------------+--------+-------+---------+
 => nil
```

## User Stories

```
As an account holder
So that I can manage my money
I need to have a bank account with an initial balance of zero

As an account holder
So that I can store my money safely
I need to be able to deposit money into my account

As an account holder
So that I can spend money
I need to be able to withdraw money from my account

As an account holder
So that I can log my account activity
I need to have a transaction history

As an account holder
So that I can see my transaction history
I need to be able to print an account statement as a table
```

## Notes

Initially, I drew out my Domain Model to include three classes; Account, Balance, and Transactions. The starting balance attribute in the Account class would have been extracted from the Balance class, which would have the balance attribute. Additionally, the ```.deposit(amount)``` and ```.withdraw(amount)``` methods would only display the results, which are to be calculated in the Balance class with ```.add(amount)``` and ```.deduct(amount)``` methods. However, this involved using doubles/mocks. Considering I have not fully grasped how to use doubles/mocks, I decided to remove the Balance class in order to be able to complete the challenge without taking too much time.

The final tests to test whether a statement was printing I did not manage to figure out how to write the test to show that the output is a table. I also did not manage to get a test to show whether some strings or code is included in the table. However the table works when run in the terminal, as shown below.

### Code Review

After my code review with a coach, as I suspected I needed a third class, but not a Balance class - I needed to extract a Statement class from the Transactions class, since it was responsible for storing rows of transactions AND printing out the statement table. Thiswas not in line with the Single Responsibility Principle, so extracting a class for printing the Statement would fix that.

Another problem was my "bad code" - I was keeping track of the balance in two different classes, and it was being updated separately in each class. I initially did this because I needed to access the balance instance variable in the Transactions class. However this could have raised errors in the future, so I managed to change my `.credit(amount)` and `.debit(amount)` methods, passing them two parameters instead like `.credit(balance, amount)` and `.debit(balance, amount)`. This way, when the method is called in the Account class it inputs the updated balance, which is then passed as one of the arguments, being able to input the updated balance into the rows of transactions.
