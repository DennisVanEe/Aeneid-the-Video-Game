
#include "NPCInterface.as";

void initialize()
{

}

void step( uint16 milliseconds )
{

}

class AIChar : NPC
{
	private bool invincibility;
	private int cHealth;
	private int mHealth;
	private CharPosition pos;
	private double walkSpeed;

	AIChar ( int mH, int cH, int x, int y, double angle, double walk, bool inv )
	{
		cHealth = cH;
		mHealth = mH;
		pos = new CharPosition ( x, y, angle );
		walkSpeed = walk;
		invincibility = inv;
	}

	// Implemented function
	void follow ( AIChar aic )
	{
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.getY() - rPos.getY();
		int xDif = pos.getX() - rPos.getX();

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

	// Implemented function
	void rotate ()
	{

	}

	// Implemented function
	void setRotation ()
	{

	}

	// Implemented function
	const CharPosition@ getPos()
	{
		CharPosition@ refPos = pos;

		if (refPos != null )
		{
			return refPos;
		}
		return CharPosition( 0, 0, 0 );
	}

	// Implemented function
	void move()
	{
		
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