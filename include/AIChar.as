// Name: AIChar.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class is designed to be an NPC 
// that is AI controlled (like followers
// or enemies)

import ControllableChar @ getAeneas() from "Aeneas.as";
#include "Character.as"
#include "Weapon.as"
#include "ControllableChar.as"

shared class AIChar : Character
{
	float PI = 3.14159;
	CharPosition @ cpos; // name conflict with method names
	CharStats @ cstats; // name conflict with method names
	private ee::AnimatedEntity entityMove;
	private ee::AnimatedEntity entityAttack;
	private ee::AnimatedEntity entityAttackMove;
	private string name;

	AIChar() {
		Character();

		cpos = getPos(); 
		cstats = getStat();
	}

	AIChar( string contName, string entName ) {
		Character();

		entityMove = ee::AnimatedEntity( contName, entName + "Move" ); // CHECK TO SEE IF THIS WORKS
		entityAttack = ee::AnimatedEntity( contName, entName + "Attack" );
		entityAttackMove = ee::AnimatedEntity( contName, entName + "AttackMove" );
		name = entName;

		setEntityVisibilities( true, false, false );
		entityMove.setFrame( 0 );

		cpos = getPos(); 
		cstats = getStat();
	}

	// Constructor with all values as parameter
	AIChar( string contName, string entName, int x, int y, double angle, int cH, int mH, float wS, float rS, bool immunity, bool hostile, int damage ) {
		Character( x, y, angle, cH, mH, wS, rS, immunity, hostile, damage );

		entityMove = ee::AnimatedEntity( contName, entName + "Move" ); // CHECK TO SEE IF THIS WORKS
		entityAttack = ee::AnimatedEntity( contName, entName + "Attack" );
		entityAttackMove = ee::AnimatedEntity( contName, entName + "AttackMove" );
		name = entName;

		setEntityVisibilities( true, false, false );
		entityMove.setFrame( 0 );

		cpos = getPos(); 
		cstats = getStat();
	}

	void setAnimationStates( uint32 milliseconds ) {
		if( entityMove.isVisible() )
			entityMove.playFrame( (milliseconds) ); //errors 
		else if( entityAttack.isVisible() )
			entityAttack.playFrame( milliseconds ); //errors
		else
			entityAttackMove.playFrame( milliseconds );
	}

	void setEntityVisibilities( bool m, bool a, bool am ) {
		entityMove.setVisible( m );
		entityAttack.setVisible( a );
		entityAttackMove.setVisible( am );
	}

	void follow ( Character aic, uint32 milliseconds )
	{
		ee::consolePrintln( "AIChar.as/follow: another AIChar follows this AIChar." );
		//Andrew made a new inRange function below this that does same function as this whole comment
		
		/* CharPosition@ rPos = aic.getPos();

		int yDif = pos.getY() - rPos.getY();
		int xDif = pos.getX() - rPos.getX();

		double angle = 180 / PI * atan( ( float(yDif) ) / xDif ); 
		if( xDif < 0 ) {
			pos.setAngle(pos.getAngle() + 180);
		}


		float distance = sqrt( yDif*yDif + xDif*xDif ); 
		float bubble = 30; //or 20

		updatePos( pos.getX(), pos.getY(), pos.getAngle() );

		// NOTE: Changed this so that it actually moves DIRECTLY towards AIChar being followed
		// with the correct speeds (using cos and sin) */
		if(inRange(aic))
		{
			/*
			updatePos( pos.x + stats.walkSpeed * milliseconds / 1000, 
					pos.y + stats.walkSpeed * milliseconds / 1000, pos.getAngle() );
			*/
			int x = cpos.getX() + cstats.getWalkSpeed() * milliseconds / 1000 * cos( PI / 180 * cpos.angle );
			int y = cpos.getY() + cstats.getWalkSpeed() * milliseconds / 1000 * sin( PI / 180 * cpos.angle );
			updatePos( x, y, cpos.angle );
			entityMove.playFrame( milliseconds );
		}
		else
			updatePos( cpos.getX(), cpos.getY(), cpos.getAngle() );
			entityMove.setFrame( 0 );

	}
	
	bool inRange(Character aic)
	{
		ee::consolePrintln( "AIChar.as/inRange: checks if another AIChar is within 50 units of this AIChar." );
		CharPosition @ rPos = aic.getPos();

		int yDif = cpos.getY() - rPos.getY();
		int xDif = cpos.getX() - rPos.getX();

		float distance = sqrt( yDif*yDif + xDif*xDif ); 
		float bubble = 50; 
		
		if( bubble > distance )
		return false;
		else
		return true;
	}
	
	bool inRangeToAttack(Character aic)
	{
		ee::consolePrintln( "AIChar.as/inRangeToAttack: checks if another AIChar is within 5 units to attack this AIChar." );
	 	CharPosition @ rPos = aic.getPos();

		int yDif = cpos.getY() - rPos.getY();
		int xDif = cpos.getX() - rPos.getX();

		float distance = sqrt( yDif*yDif + xDif*xDif ); 
		float bubble = 5; 
		
		if( bubble > distance )
		return false;
		else
		return true;
	}

	void updatePos( int iX, int iY, double ang )
	{
		ee::consolePrintln( "AIChar.as/updatePos: Updates the position and angle of the character." );
		cpos.setX(iX);
		cpos.setY(iY);
		cpos.setAngle(ang);
		
	}

	void rotate ( uint32 milliseconds )
	{
		ee::consolePrintln( "AIChar.as/rotate: Updates angle of the character" );
		cpos.angle += cstats.rotationSpeed / 1000 * milliseconds; 
	}

	CharPosition @ getPos()
	{
		ee::consolePrintln( "AIChar.as/getPos: Returns the position of the character." );
		CharPosition@ refPos = cpos;

		if ( refPos != null )
		{
			return refPos;
		}
		ee::consolePrintln( "ERROR: CharPosition of AIChar is null.");
		return CharPosition( 0, 0, 0 );
	}

	//Randomly moves when Aeneas is not around. When Aeneas is within a certain range, will begin to follow and attack 
	//WORK IN PROGRESS
	void move(uint32 milliseconds)
	{	
		ee::consolePrintln( "AIChar.as/move: moves the character." );
		int x;

		if( x % 3 == 0 )
			cpos.angle += 0.1 * milliseconds; // 0.1 is pixels of rotation per millisecond
		else if( x % 3 == 1 )
			cpos.angle -= 0.1 * milliseconds;

		// TODO: Add function for boundary collision and reverse direction immediately

		// NOTE: Allow for gradual angle changes as well
		updatePos( cos( cpos.getAngle() * PI / 180 ) * milliseconds * cstats.getWalkSpeed() / 1000, 
			   sin( cpos.getAngle() * PI / 180 ) * milliseconds * cstats.getWalkSpeed() / 1000, 
			   cpos.getAngle() );
		if( ee::isColliding( entityMove.getSprite() ) ) {
			updatePos( cpos.x - 2, cpos.y - 2, cpos.angle );
		}
		setEntityVisibilities( true, false, false );
		entityMove.playFrame( milliseconds ); //errors
	}

	//Please Check this method for me! -Rene Lee
	// Checked -Jason Wang
	void attack(Character npc, uint32 milliseconds ) //shouldn't it pass in nothing? (unless "int damage" is how much damage the enemy does) -Andrew
	{
		ee::consolePrintln( "AIChar.as/attack: attacks another Character." ); 
		int damages = cstats.getDamage();
		// DO THE attack animation
		npc.stats.damage( damages );

		setEntityVisibilities( false, true, false ); // move, attack, attackmove
		entityAttack.playFrame( milliseconds ); //errors
	}

	void talk( string phrase )
	{	
		ee::consolePrintln( "AIChar.as/talk: shows text for this Character's speech" );
		// make text appear on screen
		ee::AnimatedEntity text = ee::AnimatedEntity(); //errors here (talk to dennis)
		text.setVisible(true); //might not use this entire method
		
	}

	void changeHealth( int difference )
	{
		ee::consolePrintln( "AIChar.as/changeHealth: changes the health of this Character." );
		if( stats.isInvincible() ) 
			return;
		stats.damage( difference ); 
		if(cstats.getCHealth() <= 0)
		{
			// change image to dead body and kill NPC
		}
	}
	
	//i think this method is unused
	/*
	void fighting(Character npc, uint32 milliseconds)
	{
		ee::consolePrintln( "AIChar.as/fighting: follows another Character and attacks." );
		if(!inRange(npc))
			return;
		
		follow(npc, milliseconds);
		/*int nx = npc.CharPosition().x;
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
			angle = 90 + int(atan(abs(cy-ny),abs(cx-nx))); 
			setPosition(angle); //can divide angle by 10 or something so that it doesnt turn instantaneously or use MOVE FUNCTION
		}
		else{setRotation(int(atan(abs(cy-ny),abs(cx-nx))));} */
		
		//shouldn't be exacty 180 since comparing doubles
		/*
		if( abs( pos.angle - npc.pos.angle )<181 && abs( pos.angle - npc.pos.angle ) > 179  && inRangeToAttack(npc) )
			attack(npc, milliseconds);  //illegal access to npc.pos
	}
	*/

	bool isHostile()
	{
		ee::consolePrintln( "AIChar.as/isHostile: returns true if the Character is hostile." );
		return cstats.isHostile();
	}

	// Panicked citizen runs around in circles
	void citizenMove( uint32 milliseconds ) {
		ee::consolePrintln( "AIChar.as/citizenMove: makes the citizen run in panicked circles." );
		
		cpos.angle += 0.1 * milliseconds; // 0.1 is pixels of rotation per millisecond

		// TODO: Add function for boundary collision and reverse direction immediately

		updatePos( cos( cpos.getAngle() * PI / 180 ) * milliseconds * cstats.getWalkSpeed() / 1000, 
			   sin( cpos.getAngle() * PI / 180 ) * milliseconds * cstats.getWalkSpeed() / 1000, 
			   cpos.getAngle() );
		if( ee::isColliding( entityMove.getSprite() ) ) {
			updatePos( cpos.x - 2, cpos.y - 2, cpos.angle );
		}
		setEntityVisibilities( true, false, false );
		entityMove.playFrame( milliseconds ); //errors
	}
	
	// bool aeneasInRange(/*AENEAS REFERENCE*/)
	//{
		//If Aeneas in range
		//return true
		//THIS MUST BE REFERENCED IN step FUNCTION TO DETERMINE IF SHOULD FOLLOW/ATTACK AENEAS AND MOST IMPORTANTLY TO TURN INVINCIBLE
	//} 

	void step( uint32 milliseconds, array<AIChar> enemies) {
		//MUST FIRST GET AN AENEAS REFERENCE AND CHECK ITS POSITION TO SEE IF IT SHOULD BE INVINCIBLE AND/OR ATTACK HIM!!! (ASK DENNIS)
		ee::consolePrintln( "AIChar.as/step: step function." );
		ControllableChar @ aeneas = getAeneas();
		bool thereIsEnemy;
		if(!inRange(aeneas))
		{
			cstats.setInvincibility(true);
			
			thereIsEnemy = false;
			for(int i = 0; i<enemies.length(); i++)
			{
				if(inRange(enemies[i])) 
					{if(inRangeToAttack(enemies[i]))
						attack(enemies[i], milliseconds);
					else
						follow(enemies[i], milliseconds);
					}
					thereIsEnemy = true;
					break;
			}
		}
		else
		{
			cstats.setInvincibility(false);
			follow(aeneas, milliseconds);
			if(inRangeToAttack(aeneas))
				attack(aeneas, milliseconds);
		}
		
		if(!thereIsEnemy && !inRange(aeneas)) // Make sure bool thereIsEnemy is there for use in else statement (not just in if)
			move(milliseconds); // Should move randomly
		
		// If Aeneas comes within a certain distance, follow Aeneas and attack him.
			// All AIChar are invincible UNTIL they engage in combat with Aeneas.
			// This is done to prevent AIChar from dying before Aeneas comes.
			// Essentially, if this is not done, AI will die before Aeneas even
			// reaches them.

		// IF THERE IS TIME:
			// Figure out a way to make friendly AI (Trojans) talk when clicked upon
				// This is partially done in ControllableChar class already
			// Maybe have some random Trojan "gangs" wandering around
	}

	ee::AnimatedEntity getEntity() {
		return entityMove;
	}

	void requestSaveData( string prefix, int i ) {
		//HAVE TO MAKE A THIRD PARAMETER FOR AN INTEGER LIKE DENNIS SAID
		ee::writeToDataCont( prefix + i, "cHealth", cstats.getCHealth() );
		ee::writeToDataCont( prefix + i, "mHealth", cstats.getMHealth() );
		ee::writeToDataCont( prefix + i, "walkSpeed", cstats.getWalkSpeed() );
		ee::writeToDataCont( prefix + i, "rotationSpeed", cstats.getRotationSpeed() );
		int temp = 0;
		if( cstats.isInvincible() )
			temp = 1;
		else
			temp = 0; // Allows bool to be saved as integer
		ee::writeToDataCont( prefix + i, "invincibility", temp );
		temp = 0;
		if( cstats.isHostile() )
			temp = 1;
		else
			temp = 0; // Allows bool to be saved as integer
		ee::writeToDataCont( prefix + i, "isItHostile", temp );
		ee::writeToDataCont( prefix + i, "damage", cstats.getDamage() );

		ee::writeToDataCont( prefix + i, "x", cpos.x );
		ee::writeToDataCont( prefix + i, "y", cpos.y );
		ee::writeToDataCont( prefix + i, "angle", cpos.angle );
	}
}

//I don't think we are using this Action class
class Action
{
	/*
	string movement;
	int degree;
	
	Action( string m, int d ) {
		// ee::consolePrintln( actionName + " is being executed." );
		movement = m;
		degree = d;
	}
	*/
	string actionName;

	Action( string aN ) {
		actionName = aN;
	}

}