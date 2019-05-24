/* 
 * sudo apt install mono-complete
 * export TERM=xterm
 * mcs csharp.cs -out:hello-csharp
 * ./hello-csharp
 */
using System;
namespace HelloWorldApplication
{
   class HelloWorld
   {
      static void Main(string[] args)
      {
         Console.WriteLine("Hello World");
         //Console.ReadKey();
      }
   }
}
