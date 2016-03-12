// Name: Menu.as
// Author(s):
// version 0.1
// --------------------------------------
// This interface is used to define a class
// as a menu
#include "include/Button.as"
class Menu
{
	array<Button> buttons; 
	private dictionary< Button > buttons;
	
	Menu( )
	{
		buttons = dictionary< Button >();
	}
	
	void addButton( const string &in name, Button b )
	{
		buttons.set( name, b );
	}

	void removeButton( const string &in name )
	{
		if( buttons.exists( name ) )
		{
			buttons.delete( name );
		}
	}
	
	void step();
}