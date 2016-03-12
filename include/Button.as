class Button
{
	private AnimatedEntity ent;
	private string name;

	Button(string &in loc, string &in n)
	{
		ent = getAnimatedEntity(loc, name);
		name = n;
	}
	
	Button()
	{
		ent = null;
	}
	
	bool isNull()
	{
		if( ent == null )
			return true;
		else
			return false
	}
	
	bool isPressed()
	{
		if(intersect(ent, getMouseXPosition(), getMouseYPosition()))
		{
			if(isButtonPressed(LEFT))
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