public class MainMenu : Menu
{
	public void step()
	{
		bool buttonIsPressed = false;
		String nameButtonPressed;
		for( int i = 0; i < test.length(); i++ )
		{
			if( test[i].isPressed() )
			{
				buttonIsPressed = true;
				nameButtonPressed = test[i].getButtonName();
				break;
			}
		}
		if( buttonIsPressed)
		{
			//Need function of each button name here
		}
		
	}
}