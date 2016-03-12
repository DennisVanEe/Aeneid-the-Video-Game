// Name: AIChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class is designed to be an NPC 
// that is AI controlled (like followers
// or enemies)

#include "Character.as"

class AIChar : Character
{
	AIChar ( int mH, int cH, int x, int y, double angle, double walk, bool inv, bool host )
	{
		Character( );
		ee::consolePrintln( "Sets the character stats." );
		cHealth = cH;
		mHealth = mH;
		pos = CharPosition( x, y, angle );
		walkSpeed = walk;
		invincibility = inv;
		isItHostile = host;
	}

	void follow ( Character aic, uint16 milliseconds )
	{
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y(); // updated to public variable
		int xDif = pos.x - rPos.x(); //updated to public variable

		double angle = atan( ( float(yDif) ) / xDif );
		float distance = sqrt( yDif*yDif + xDif*xDif );
		float bubble = 30; //or 20

		updatePos( pos.x, pos.y, angle );
		if( bubble < distance )
		{
			updatePos( pos.x + walkspeed * milliseconds / 1000, 
					pos.y + walkspeed * milliseconds / 1000, angle );
		}
		else
			updatePos( pos.x, pos.y, angle );

	}

	void updatePos( int iX, int iY, double ang )
	{
		ee::consolePrintln( "Updates the position and angle of the character." );
		pos.setX( iX );
		pos.setY( iY );
		pos.setAngle( ang );
	}

	void rotate ( uint16 milliseconds )
	{
		ee::consolePrintln( "Rotates angle of the character" );
		pos.angle += rotationSpeed / 1000 * milliseconds;
	}

	const CharPosition@ getPos()
	{
		ee::consolePrintln( "Returns the position of the character." );
		CharPosition@ refPos = pos;

		if (refPos != null )
		{
			return refPos;
		}
		return CharPosition( 0, 0, 0 );
	}

	//Randomly moves when Aeneas is not around. When Aeneas is within a certain range, will begin to follow and attack 
	//WORK IN PROGRESS
	void move(uint16 milliseconds)
	{	
		updatePos( cos(pos.angle*3.14159/180)*milliseconds*walkSpeed/1000,
			   sin(pos.angle*3.14159/180)*milliseconds*walkspeed/1000,
			   angle );
		
	}

	//Please Check this method for me! -Rene Lee
	void attack( int damage ) //shouldn't it pass in nothing? (unless "int damage" is how much damage the enemy does) -Andrew
	{
		if( )
	}

	void talk( string phrase )
	{	
		// make text appear on screen
		AnimatedEntity text = new AnimatedEntity();
		addEntitytoRender(0,text,n); //how to add "phrase" onto entity?-Andrew
		
	}

	void changeHealth( int difference )
	{
		if(invincibility)
			return;
		cHealth -= difference;
		if(cHealth <= 0)
		{
			// change image to dead body and kill NPC
		}
	}
	
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
			angle = 180 + int(atan(abs(cy-ny),abs(cx-nx)));
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

	bool isHostile()
	{
		if( isItHostile )
			return true;
		else
			return false;
	}

	void requestSaveData( int npcNumber ) {

	}
}

class Action
{
	string movement;
	int degree;
	
	Action( string m, int d ) {
		ee::consolePrintln( /*prints out what this is doing*/ );
		movement = m;
		degree = d;
	}

}