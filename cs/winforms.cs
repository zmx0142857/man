// mcs winforms.cs -r:System.Windows.Forms.dll -out:winforms
using System.Windows.Forms;

public class HelloWorld : Form {
	public static void Main() {
		Application.Run(new HelloWorld());
	}

	public HelloWorld() {
		Text = "Hello WinForms";
	}
}
