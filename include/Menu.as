// Name: Menu.as
// Author(s):
// version 0.1
// --------------------------------------
// This interface is used to define a class
// as a menu

abstract class Menu
{
	array<Button@> test; 
	
	public bool addButton(const string &in loc, const string &in name)		//need position
	{
		test.insertLast(Button(loc, name));
		if (test[test.size()] == null)
		{
			consolePrintLine("[ERROR]: button named " + name + " in container " + loc " is null");
			test.removeLast(); // remove the null button
			return false;
		}
		return true;	
	}
	
	//Need a method for adding graphics (title, side pictures, etc.)
	
	public void step();
}