#include "Menu.as"
#include "Button.as"

class MainMenu : Menu
{
	bool buttonPressed = false;
	
	void step(uint32 milliseconds)
	{
		if(!buttonPressed)
		{ee::StaticEntity title = ee::StaticEntity();
		ee::StaticEntity text = ee::StaticEntity();
		ee::StaticEntity background = ee::StaticEntity();
		//actually need to make these things and put in the art for the background
		
		addEntityToRender(0, title, "Title");
		addEntityToRender(0, text, "Text");
		addEntityToRender(0, background, "Background");
		
		title.makeVisible();
		text.makeVisible();
		background.makeVisible();
		}
		//ADD TO RENDER
		/*bool buttonIsPressed = false;
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
		} */
		
		if(isKeyPressed(Key) || isButtonPressed(Button))  //any key or any button
			{
				buttonPressed = true;
				title.clearAllEntityToRender();
				text.clearAllEntityToRender();
				background.clearAllEntityToRender();
				
			}
			//REMOVE FROM RENDER
	}
	
	bool buttonWasPressed()
	{
		return buttonPressed;
	}
}