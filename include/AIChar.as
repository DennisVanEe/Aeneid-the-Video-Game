// Name: AIChar.as
// Author(s):
// version 0.1
// --------------------------------------
// This class is designed to be an NPC 
// that is AI controlled (like followers
// or enemies)

#include "Character.as"

class AIChar : Character
{
	final double rotationSpeed = 10; // to be set later after testing. degree per seconds
	private bool invincibility;
	private int cHealth;
	private int mHealth;
	private CharPosition pos;
	private double walkSpeed;
	private bool isHostile;

	AIChar ( int mH, int cH, int x, int y, double angle, double walk, bool inv, bool host )
	{
		cHealth = cH;
		mHealth = mH;
		pos = new CharPosition ( x, y, angle );
		walkSpeed = walk;
		invincibility = inv;
		isHostile = host;
	}

	void follow ( AIChar aic )
	{
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y(); // updated to public variable
		int xDif = pos.x - rPos.x(); //updated to public variable

		double angle = Math.atan( ( (float) yDif ) / xDif );
		float distance = Math.sqrt( yDif*yDif + xDif*xDif );

		// TODO: Update positions
		// TODO: Finish follow method
	}

	void updatePos( int iX, int iY, double ang )
	{
		pos.setX( iX );
		pos.setY( iY );
		pos.setAngle( ang );
	}

	void rotate ( uint16 milliseconds )
	{
		pos.angle += rotationSpeed / 1000 * milliseconds;
	}

	const CharPosition@ getPos()
	{
		CharPosition@ refPos = pos;

		if (refPos != null )
		{
			return refPos;
		}
		return CharPosition( 0, 0, 0 );
	}

<<<<<<< HEAD:AIChar.as
	//Randomly moves when Aeneas is not around
	//When Aeneas is within a certain range, will begin to follow and attack 
	// ROUGH EDIT, PLEASE REVIEW
	void move(Aeneas ai)
	{
		int changeInX = (int)(Math.random()*50) * (int)(     Math.pow(-1, (int)(Math.random()*50)    ));
		int changeInY = (int)(Math.random()*50) * (int)(     Math.pow(-1, (int)(Math.random()*50)    ));
		
		int newChangeX = pos.getX() + changeInX;
		int newChangeY = pos.gety() + changeInY;
		double angle = Math.atan( ( (float) yDif ) / xDif )
		
		updatePos(
		
=======
	//Randomly moves when Aeneas is not around. When Aeneas is within a certain range, will begin to follow and attack 
	//WORK IN PROGRESS
	void move(Aeneas ai, int range)
	{
		CharPosition@ AeneasPos = ai.getPos();
		int distanceX = Math.abs(AeneasPos.x - pos.x);
		int distanceY = Math.abs(AeneasPos.y - pos.y);	
		
		if(distanceX < range || distanceY < range){
			follow(ai);
			attack(ai);
		}	
		else{
			int changeInX = (int)(Math.random()*50) * (int)(     Math.pow(-1, (int)(Math.random()*50)    ));
			int changeInY = (int)(Math.random()*50) * (int)(     Math.pow(-1, (int)(Math.random()*50)    ));
			int newChangeX = pos.getX() + changeInX;
			int newChangeY = pos.gety() + changeInY;
			double angle = Math.atan( ( (float) newChangeY ) / newChangeX );
>>>>>>> c73acc4c5e2c533a0005bde5d49af39c8cccfd5f:include/AIChar.as
		
			updatePos(newChangeX , newChangeY, angle);	
		}
	}


	void attack( int damage )
	{
		if(  )
	}

	void talk( String phrase )
	{
		// make text appear on screen
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

	void requestSaveData( int npcNumber ) {
		Request@ cH = Request( npcNumber + "npcCH", 0, WRITE_DATA, "cHealth", cHealth );
		Request@ mH = Request( npcNumber + "npcMH", 0, WRITE_DATA, "mHealth", mHealth );
		Request@ rotationSpeed = Request( npcNumber + "npcRS", 0, WRITE_DATA, "rotationSpeed", rotationSpeed );
		Request@ isHostile = Request( npcNumber + "npcIsHostile", 0, WRITE_DATA, "isHostile", isHostile );
		Request@ posX = Request( npcNumber + "npcPosX", 0, WRITE_DATA, "posX", pos.x );
		Request@ posY = Request( npcNumber + "npcPosY", 0, WRITE_DATA, "posY", pos.y );
		Request@ posAngle = Request( npcNumber + "npcPosAngle", 0, WRITE_DATA, "posAngle", pos.angle );
		Request@ invincibility = Request( npcNumber + "npcPiety", 0, WRITE_DATA, "invincibility", invincibility );
		Request@ walkSpeed = Request( npcNumber + "npcWalkSpeed", 0, WRITE_DATA, "walkSpeed", walkSpeed );

		addRequest( npcNumber + "NPC", cH );
		addRequest( npcNumber + "NPC", mH );
		addRequest( npcNumber + "NPC", rotationSpeed );
		addRequest( npcNumber + "NPC", isHostile );
		addRequest( npcNumber + "NPC", posX );
		addRequest( npcNumber + "NPC", posY );
		addRequest( npcNumber + "NPC", posAngle );
		addRequest( npcNumber + "NPC", invincibility );
		addRequest( npcNumber + "NPC", walkSpeed );
	}
}

class Action
{
	String movement;
	int degree;
	
	Action() {

	}

}