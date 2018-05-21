# Bank Tech Test

The goal is to create a Bank program that allows the user (account holder) to make basic bank transactions such as deposits and withdrawals. The user should also be able to print a bank statement and see their transaction history. The data of transactions should be kept in memory; it does not need to be stored in a database.

This program is written in Ruby language, using OOD and TDD.

## Criteria

_Given_ a client makes a deposit of 1000 on 10-01-2012
_And_ a deposit of 2000 on 13-01-2012
_And_ a withdrawal of 500 on 14-01-2012
_When_ she prints her bank statement
_Then_ she would see

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
I need to have a bank account

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
