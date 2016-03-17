
class Button
{
	private ee::AnimatedEntity ent;
	private string name;

	Button(string &in n)
	{
		ent = ee::AnimatedEntity("Button", n); //cannot find getAnimatedEntity
		name = n;
	}
	
	Button()
	{
		ent = null; //error convert null handle to ee::AnimatedEntity
	}
	
	bool isNull()
	{
		if( ent == null ) //need to be handles
			return true;
		else
			return false;
	}
	
	bool isPressed()
	{
		if(intersect(ent, getMouseXPosition(), getMouseYPosition())) //getMouseX and getMouseY unknown
		{
			if(isButtonPressed(LEFT)) //LEFT not declared
			{
				ent.setFrame(2);
				return true;
			}
		}
		ent.setFrame(1);
		return false;
	}

	string getButtonName()
	{
		return name;
	}
	
	~Button()
	{
	}
}