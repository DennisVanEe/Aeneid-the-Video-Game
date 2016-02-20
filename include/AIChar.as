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
}

class Action
{
	String movement;
	int degree;
	
	Action() {

	}

}