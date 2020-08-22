// mcs main.cs account.cs transaction.cs -out:main
using System;

namespace zmx {
	class MainClass {
		static void Main(string[] args) {
			var account = new Account("zmx", 1000);
			Console.WriteLine($"{{id: {account.id}, name: {account.name}, balance: {account.balance}}}");
			account.Withdraw(500, DateTime.Now, "Rent payment");
			Console.WriteLine(account.balance);
			account.Deposit(100, DateTime.Now, "Friend paid me back");
			Console.WriteLine(account.balance);

			try {
				var invalidAccount = new Account("invalid", -55);
			} catch (ArgumentOutOfRangeException e) {
				Console.WriteLine("exception!");
				Console.WriteLine(e);
			}
		}
	}
}
