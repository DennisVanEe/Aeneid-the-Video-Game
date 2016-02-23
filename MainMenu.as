#include "include/Menu.as"

class MainMenu
{
	public MainMenu()
	{
		consolePrintLine("Constructing a MainMenu");
		addButton(/*TODO: list out the buttons needed*/);
		//...
	}
	
	void step(uint16 mil)
	{
		if (uint i = 0; i < buttons.size(); i++)
		{
			if (buttons[i].isPressed)
			{
				// button namesand what they do
				if (button[i].getName() == "start")
					// do something
				else if //...
			}
		}
	}
}
		
