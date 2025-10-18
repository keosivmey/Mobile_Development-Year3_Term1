import 'dart:async';

class BankAccount {
    // TODO
    final int accountID;
    final String accountOwner;
    double _balance;

    BankAccount(this.accountID, this.accountOwner) : _balance = 0.0;

    double balance() {
      return _balance;

    }

    void withdraw(double amount) {
      if (amount <= 0) {
        throw ArgumentError('The amount must be positive.'); //if the user enter the amount below 0
      }

      if (_balance - amount < 0) { // throw the exception if the balance is not enough 
        throw StateError('Insufficient balance. Cannot withdraw $amount because the current balance is $_balance.');
      }

      _balance -= amount;
    print('Withdrawal successful. Account $accountID new balance: $_balance');
    }

    void credit (double amount) {
      if (amount <= 0) {
        throw ArgumentError('Credit amount must be positive.');
      }
    
      // Adds the given amount to the account balance.
      _balance += amount;
        print('Credit successful. Account $accountID new balance: $_balance');
    }
    
}

class Bank {
    // TODO
  final String name;
  // Using a private Map to store accounts for the key that is the unique accountId.
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.name}); // Constructor to set the bank name

  //create Account
  BankAccount createAccount(int accountID, String accountOwner) {
    // Ensure that the account ID is unique.
    if (_accounts.containsKey(accountID)) {
      //throw an axcepion
      throw ArgumentError('Account ID $accountID already exists in the bank.');
    }
    // Create a new bank account
    final newAccount = BankAccount(accountID, accountOwner);

    // Add the account to the bank list and return it
    _accounts[accountID] = newAccount;
    print('Account created successfully for $accountOwner with ID $accountID.');
    return newAccount;

  } 

}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

   try {
     ronanAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
