#include "Menu.as"
#include "Button.as"

class MainMenu : Menu
{
	private dictionary< Button > buttons;

	MainMenu( )
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

	void step()
	{
		bool buttonIsPressed = false;
		string nameButtonPressed;
		for( int i = 0; i < buttons.length(); i++ )
		{
			if( buttons[i].isPressed() )
			{
				buttonIsPressed = true;
				nameButtonPressed = buttons[i].getButtonName();
				break;
			}
		}
		if( buttonIsPressed )
		{
			//Need function of each button name here
		}
		
	}
}