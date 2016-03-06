// Name: AIChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class is designed to be an NPC 
// that is AI controlled (like followers
// or enemies)

#include "include/Character.as"

class AIChar : Character
{
	final double rotationSpeed = 10; // to be set later after testing. degree per seconds
	private bool invincibility;
	private int cHealth;
	private int mHealth;
	private CharPosition @ pos;
	private double walkSpeed;
	private bool isHostile;

	AIChar ( int mH, int cH, int x, int y, double angle, double walk, bool inv, bool host )
	{
		consolePrintLine( "Sets the character stats." );
		cHealth = cH;
		mHealth = mH;
		pos = new CharPosition ( x, y, angle );
		walkSpeed = walk;
		invincibility = inv;
		isHostile = host;
	}

	void follow ( Character aic, uint16 milliseconds )
	{
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y(); // updated to public variable
		int xDif = pos.x - rPos.x(); //updated to public variable

		double angle = atan( ( (float) yDif ) / xDif );
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
		consolePrintLine( "Updates the position and angle of the character." );
		pos.setX( iX );
		pos.setY( iY );
		pos.setAngle( ang );
	}

	void rotate ( uint16 milliseconds )
	{
		consolePrintLine( "Rotates angle of the character" );
		pos.angle += rotationSpeed / 1000 * milliseconds;
	}

	const CharPosition@ getPos()
	{
		consolePrintLine( "Returns the position of the character." );
		CharPosition@ refPos = pos;

		if (refPos != null )
		{
			return refPos;
		}
		return CharPosition( 0, 0, 0 );
	}

	//Randomly moves when Aeneas is not around. When Aeneas is within a certain range, will begin to follow and attack 
	//WORK IN PROGRESS
	void move(Aeneas ai, int range)
	{
		consolePrintLine( "Randomly moves when Aeneas is not around. When Aeneas is within a certain range, character will begin to follow and attack." );
		CharPosition@ AeneasPos = ai.getPos();
		int distanceX = Math.abs(AeneasPos.x - pos.x);
		int distanceY = Math.abs(AeneasPos.y - pos.y);	
		
		//When Aeneas is near.
		if(distanceX < range || distanceY < range){
			follow(ai);
			attack(ai);
		}	
		//When Aeneas is not near.
		else{
			int changeInX = (int)(Math.random()*50) * (int)(     Math.pow(-1, (int)(Math.random()*50)    ));
			int changeInY = (int)(Math.random()*50) * (int)(     Math.pow(-1, (int)(Math.random()*50)    ));
			int newChangeX = pos.getX() + changeInX;
			int newChangeY = pos.gety() + changeInY;
			double angle = Math.atan( ( (float) newChangeY ) / newChangeX );
		
			updatePos(newChangeX , newChangeY, angle);	
		}
	}

	//Please Check this method for me! -Rene Lee
	void attack( int damage ) //shouldn't it pass in nothing? (unless "int damage" is how much damage the enemy does) -Andrew
	{
		if( )
	}

	void talk( String phrase )
	{	
		// make text appear on screen
		AnimatedEntity text = new AnimatedEntity();
		addEntitytoRender(0,text,n); //how to add "phrase" onto entity?-Andrew
		
	}

	void changeHealth( int difference );
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

	bool isHostile()
	{
		if( isHostile )
			return true;
		else
			return false;
	}

	void requestSaveData( int npcNumber ) {

	}
}

class Action
{
	String movement;
	int degree;
	
	Action( String m, int d ) {
		consolePrintLine( //prints out what this is doing );
		movement = m;
		degree = d;
	}

}