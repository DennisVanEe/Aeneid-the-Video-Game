//#include "Menu.as"
//#include "Button.as"

class MainMenu// : Menu
{
	bool buttonPressed = false;
	ee::StaticEntity title;
	ee::StaticEntity text;
	ee::StaticEntity background;
	MainMenu() {
		//Menu();
		title = ee::StaticEntity( "MainMenu", "title" );
		text = ee::StaticEntity( "MainMenu", "text" );
		background = ee::StaticEntity( "MainMenu", "background" );
	}
	
	void step(uint32 milliseconds)
	{
		//actually need to make these things and put in the art for the background
		
		//title.makeVisible();
		//text.makeVisible();
		//background.makeVisible();
		
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
		
		if( ee::isKeyPressed( ee::Space ) )  //any key or any button
			{
				buttonPressed = true;
				//title.clearAllEntityToRender();
				//text.clearAllEntityToRender();
				//background.clearAllEntityToRender();
				title.setVisible(false);
				text.setVisible(false);
				background.setVisible(false);
			}
			//REMOVE FROM RENDER
	}
	
	bool buttonWasPressed()
	{
		return buttonPressed;
	}
}