// Name: Menu.as
// Author(s):
// version 0.1
// --------------------------------------
// This interface is used to define a class
// as a menu

abstract class Menu
{
	array<Button@> test; 
	
	public void addButton(Button@ x)		//need position
	{
		test.insertLast(x);
		
	}
	
	public void step();
}