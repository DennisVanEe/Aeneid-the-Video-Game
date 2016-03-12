// Name: Menu.as
// Author(s):
// version 0.1
// --------------------------------------
// This interface is used to define a class
// as a menu

abstract class Menu
{
	array<Button@> buttons; 
	
	bool addButton(const string &in loc, const string &in name)		//need position
	{
		buttons.insertLast(Button(loc, name));
		if (buttons[buttons.size()] == null)
		{
			consolePrintLine("[ERROR]: button named " + name + " in container " + loc " is null");
			buttons.removeLast(); // remove the null button
			return false;
		}
		return true;	
	}
	
	public void step();
}