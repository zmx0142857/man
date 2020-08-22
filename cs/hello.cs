/* 
 * compile and run:
 *
 * $ sudo apt install mono-complete
 * $ export TERM=xterm
 * $ mcs hello.cs -out:hello
 * $ ./hello
 *
 * run interactively:
 *
 * $ csharp
 * csharp> print("hello")
 *
 * 一键上网
 * $ csharp -e 'new System.Net.WebClient().DownloadString("http://nitrome.com")'
 */
using System;

class Hello {
	static void Main(string[] args) {
		string name = "Csharp";
		Console.WriteLine($"Hello {name}");
	}
}
