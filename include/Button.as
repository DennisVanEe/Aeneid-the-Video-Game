public class Button
{
	private AnimatedEntity@ ent;
	private string name;

	Button(String &in n)
	{
		ent = getAnimatedEntity(n);
		addEntityToRender(0, ent, n);
		name = n;
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