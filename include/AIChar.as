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
	CharPosition @ pos; //name conflict
	CharStats @ stats; //name conflict

	AIChar() {
		Character();

		pos = getCharPosition(); //getCharPosition() unknown cannot find
		stats = getStat();
	}

	// Constructor with all values as parameter
	AIChar( int x, int y, double angle, int cH, int mH, float wS, float rS, bool immunity, bool hostile ) {
		Character( x, y, angle, cH, mH, wS, rS, immunity, hostile );

		pos = getCharPosition(); //getCharPosition() unknown cannot find
		stats = getStat();
	}

	void follow ( Character aic, uint16 milliseconds )
	{
		CharPosition@ rPos = aic.getPos();

		int yDif = pos.y - rPos.y(); // y is variable of non-function
		int xDif = pos.x - rPos.x(); //x is variable of non-function

		double angle = 180 / Pi * atan( ( float(yDif) ) / xDif ); //Pi not declared
		if( xDif < 0 ) {  //if fix line 36, this is fixed
			angle += 180; //if fix line 38, this is fixed
		}


		float distance = sqrt( yDif*yDif + xDif*xDif ); //if fix line 35, this is fixed
		float bubble = 30; //or 20

		updatePos( pos.x, pos.y, angle );
		if( bubble < distance )
		{
			updatePos( pos.x + walkspeed * milliseconds / 1000, //where does walkspeed come from?
					pos.y + walkspeed * milliseconds / 1000, angle );
		}
		else
			updatePos( pos.x, pos.y, angle );

	}

	void updatePos( int iX, int iY, double ang )
	{
		ee::consolePrintln( "Updates the position and angle of the character." );
		pos.setX( iX ); //no match to CharPosition::setX(int)
		pos.setY( iY ); //same as above
		pos.setAngle( ang ); //same as above
	}

	void rotate ( uint16 milliseconds )
	{
		ee::consolePrintln( "Rotates angle of the character" );
		pos.angle += rotationSpeed / 1000 * milliseconds; //rotationspeed not declared
	}

	const CharPosition@ getPos()
	{
		ee::consolePrintln( "Returns the position of the character." );
		CharPosition@ refPos = pos;

		if (refPos != null )
		{
			return refPos;
		}
		ee::consolePrintln( "ERROR: CharPosition of AIChar is null.");
		return CharPosition( 0, 0, 0 );
	}

	//Randomly moves when Aeneas is not around. When Aeneas is within a certain range, will begin to follow and attack 
	//WORK IN PROGRESS
	void move(uint16 milliseconds)
	{	
		updatePos( cos(pos.angle*3.14159/180)*milliseconds*walkSpeed/1000,  //walkspeed not declared
			   sin(pos.angle*3.14159/180)*milliseconds*walkspeed/1000, //walkspeed not declared
			   angle ); //angle not declared (but pos.angle works)
		
	}

	//Please Check this method for me! -Rene Lee
	void attack( int damage ) //shouldn't it pass in nothing? (unless "int damage" is how much damage the enemy does) -Andrew
	{
		if( )
		//implement
	}

	void talk( string phrase )
	{	
		// make text appear on screen
		AnimatedEntity text = AnimatedEntity(); //errors here (talk to dennis)
		addEntitytoRender(0,text,n); //n not declared
		
	}

	void changeHealth( int difference )
	{
		if(invincibility) //not declared
			return;
		cHealth -= difference; //cHealth not declared
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
		angle = 90 + (int)atan(abs(cy-ny),abs(cx-nx)); //problems with brackets
		setPosition(angle); //can divide angle by 10 or something so that it doesnt turn instantaneously or use MOVE FUNCTION
	}
	else{setRotation((int)atan(abs(cy-ny),abs(cx-nx)));} //problems with brackets
	
	//shouldn't be exacty 180 since comparing doubles
	if(abs(CharPosition().angle - npc.CharPosition().angle)<181 && abs(CharPosition().angle - npc.CharPosition().angle) > 179)
		attack(/*int damage*/, npc); //the current AIChar method does not have the npc second parameter
}

	bool isHostile()
	{
		if( isItHostile ) //not declared (i know it extends isItHostilefrom another class but it still doesnt get it)
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