using System;

namespace zmx {
	public class Transaction {
		public decimal amount { get; }
		public DateTime date { get; }
		public string note { get; }

		public Transaction(decimal amount, DateTime date, string note) {
			this.amount = amount;
			this.date = date;
			this.note = note;
		}
	}
}
