public class Button
{
	private AnimatedEntity@ ent;
	private string name;

	Button(string &in loc, string &in name)
	{
		ent = getAnimatedEntity(loc, name);
		addEntityToRender(0, ent, n);
		name = n;
	}
	
	Button()
	{
		ent = null;
	}
	
	bool isNull()
	{
		return ent == null;
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

	String getButtonName()
	{
		return name;
	}
	
	~Button()
	{
		removeEntityToRender(name);
	}
	
	

}