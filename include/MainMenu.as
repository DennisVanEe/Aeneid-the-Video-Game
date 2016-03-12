#include "Menu.as"
#include "Button.as"

class MainMenu : Menu
{
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