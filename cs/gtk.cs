// mcs gtk.cs -pkg:gtk-sharp-2.0 -out:gtk
using Gtk;
using System;

class Hello {
	static void Main() {
		Application.Init();
		Window window = new window("Hello Gtk");
		window.Show();
		Application.Run();
	}
}
