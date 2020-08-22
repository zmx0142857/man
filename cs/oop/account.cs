using System;
using System.Collections.Generic;

namespace zmx {
	public class Account {

		private static int increment = 1234567890;

		public string id { get; }
		public string name { get; }
		public decimal balance {
			get {
				decimal balance = 0;
				foreach (var t in transactions) {
					balance += t.amount;
				}
				return balance;
			}
		}

		public Account(string name, decimal balance) {
			this.id = increment.ToString();
			++increment;

			this.name = name;
			Deposit(balance, DateTime.Now, "Initial balance");
		}

		private List<Transaction> transactions = new List<Transaction>();

		public void Deposit(decimal amount, DateTime date, string note) {
			if (amount <= 0) {
				throw new ArgumentOutOfRangeException(nameof(amount), "Amount of deposit <= 0");
			}
			transactions.Add(new Transaction(amount, date, note));
		}

		public void Withdraw(decimal amount, DateTime date, string note) {
			
			if (amount <= 0) {
				throw new ArgumentOutOfRangeException(nameof(amount), "Amount of withdrawal <= 0");
			}
			if (amount < 0) {
				throw new ArgumentOutOfRangeException(nameof(amount), "Amount of balance < 0");
			}
			transactions.Add(new Transaction(-amount, date, note));
		}
	}
}
