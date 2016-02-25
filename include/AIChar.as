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
	final double rotationSpeed = 10; // to be set later after testing. degree per seconds
	private bool invincibility;
	private int cHealth;
	private int mHealth;
	private CharPosition pos;
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

	void follow ( AIChar aic )
	{
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y(); // updated to public variable
+		int xDif = pos.x - rPos.x(); //updated to public variable

		double angle = Math.atan( ( (float) yDif ) / xDif );
		float distance = Math.sqrt( yDif*yDif + xDif*xDif );

		// TODO: Update positions
		// TODO: Finish follow method
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
	void attack( int damage )
	{
		if( )
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
	
		// Saves the basic values of the AIChar

		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcCH", 0, WRITE_DATA, "cHealth", cHealth ) ); // current Health
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcMH", 0, WRITE_DATA, "mHealth", mHealth ) ); // max health
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcRS", 0, WRITE_DATA, "rotationSpeed", rotationSpeed ) ); // rotationSpeed
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcIsHostile", 0, WRITE_DATA, "isHostile", isHostile ) ); // isHostile
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcPosX", 0, WRITE_DATA, "posX", pos.x ) ); // x position
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcPosY", 0, WRITE_DATA, "posY", pos.y ) ); // y position
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcPosAngle", 0, WRITE_DATA, "posAngle", pos.angle ) ); // angle
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcPiety", 0, WRITE_DATA, "invincibility", invincibility ) ); // invincibility
		addRequest( npcNumber + "NPC", 
				Request( npcNumber + "npcWalkSpeed", 0, WRITE_DATA, "walkSpeed", walkSpeed ) ); // walkspeed
		
		// Adds request to see how many numbers of AI characters there are
		// updates "number" variable to show how many NPCs there are
		addRequest( "numberOfNPCs", 
				Request( "npcNumbeAddition" + npcNumber, 0, WRITE_DATA, "number", npcNumber ) );
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