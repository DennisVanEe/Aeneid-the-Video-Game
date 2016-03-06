void fighting(Character npc)
{
	if(/*not in range*/)
		return;
	
	int nx = npc.CharPosition().x;
	int ny = npc.CharPosition().y;
	int cx = CharPosition().x;
	int cy = CharPosition().y;
	int angle;
	
	if(cx-ny <= 0 && cy-ny <= 0) //lines 12-22 is setting position to face enemy
		{
			angle = 180 + (int)atan(abs(cy-ny),abs(cx-nx));
			setPosition(angle);
		}
	else if(cx-nx<=0 && cy-ny>=0)	
	{
		angle = 90 + (int)atan(abs(cy-ny),abs(cx-nx));
		setPosition(angle); //can divide angle by 10 or something so that it doesnt turn instantaneously or use MOVE FUNCTION
	}
	else{setRotation((int)atan(abs(cy-ny),abs(cx-nx)));}
	
	if(abs(CharPosition().angle - npc.CharPosition().angle)<181 && abs(CharPosition().angle - npc.CharPosition().angle) > 179) //shouldn't be exacty 180 since comparing doubles
		attack(/*int damage*/, npc); //the current AIChar method does not have the npc second parameter
}