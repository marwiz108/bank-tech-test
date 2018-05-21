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
So that I can see my transaction history
I need to be able to print an account statement
```

## Notes

Initially, I drew out my Domain Model to include three classes; Account, Balance, and Transactions. The starting balance attribute in the Account class would have been extracted from the Balance class, which would have the balance attribute. Additionally, the ```.deposit(amount)``` and ```.withdraw(amount)``` methods would only display the results, which are to be calculated in the Balance class with ```.add(amount)``` and ```.deduct(amount)``` methods. However, this involved using doubles/mocks. Considering I have not fully grasped how to use doubles/mocks, I decided to remove the Balance class in order to be able to complete the challenge without taking too much time.
