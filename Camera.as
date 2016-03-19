// Name: Camera.as
// Author(s): Jason Wang
// version 0.1
// --------------------------------------
// This class defines the Camera, which
// is used to allow the players to see
// Aeneas and the map. This camera will
// be rubber, which means it gradually
// speeds up and slows down while
// following Aeneas.

// Notes:
// To construct, use default constructor
// void setSensor( int x, int y )
/*
		ee::Camera cameraEntity;
		cameraEntity.setSensor( float x, float y );
		cameraEntity.rotate( int degrees );
		cameraEntity.setRotation( int degrees );
		cameraEntity.setSize( float x, float y );
		ee::getWindowHeight();
		ee::getWindowWidth();
		cameraEntity.setViewPort( float x1, float y1, float x2, float y2 );
		*/

#include "include/Movable.as"
import CharPosition @ getAeneasPos() from "Aeneas.as";
import CharPosition @ getPlayer2Pos() from "Player2.as";
import float getAeneasWalkSpeed() from "Aeneas.as";
import CharStats @ getAeneasStats() from "Aeneas.as";

// -------------------------------------------------------------------------------

Camera aCamera, bCamera;

void initialize() {
	aCamera.setSize(ee::getWindowWidth() / 2, ee::getWindowHeight());
	bCamera.setSize(ee::getWindowWidth() / 2, ee::getWindowHeight());
	aCamera.setViewport(0, 0, 0.5f, 1);
	bCamera.setViewport(0.5f, 0, 0.5f, 1);
	do { // Makes sure Camera has an actual Aeneas position to focus on
		bool a = aCamera.setupPosition( "Aeneas" );
	} while ( !a );
	do { // Makes sure Camera has an actual Aeneas position to focus on
		bool b = bCamera.setupPosition( "Player2" );
	} while ( !b );
}

void step( uint32 milliseconds ) {
	// To calculate speed of camera, use x^1.5 per distance, with cap of Aeneas' walkSpeed
	aCamera.update( milliseconds );
	bCamera.update( milliseconds );

	bool b = false;
	do { // Keeps looping while health bar is not ready to be changed
		b = isReadyToChangeAeneasHealthBar();
	} while( !b );
	aCamera.updateHUD();

	b = false;
	do { // Keeps looping while health bar is not ready to be changed
		b = isReadyToChangePlayer2HealthBar();
	} while( !b );
	bCamera.updateHUD();
}

shared class Camera : Movable {

	private CharPosition pos; // Camera position
	private CharPosition @ aeneasPos; // Aeneas' position; reference, so doesn't need to be updated
	float walkSpeed;
	ee::Camera cameraEntity;
	HUD aHeadsUp;

	Camera() {
		Movable();
		pos = CharPosition();
		aHeadsUp = HUD();
		if( getAeneasPos() != null ) {
			aeneasPos = getAeneasPos();
		} else {
			ee::consolePrintLine( "ERROR: Camera.as cannot retrieve Aeneas position." );
			aeneasPos = CharPosition(0, 0, 0);
		}
	}

	Camera( int x, int y, double angle ) {
		Movable( x, y, angle );
		pos = CharPosition();
		aHeadsUp=HUD();
		if( getAeneasPos() != null ) {
			aeneasPos = getAeneasPos();
		} else {
			ee::consolePrintLine( "ERROR: Camera.as cannot retrieve Aeneas position." );
			aeneasPos = CharPosition(0, 0, 0); 
		}
	}

	bool setupPosition( string name ) {
		if( name == "Aeneas" ) {
			if( getAeneasPos() != null ) {
				aeneasPos = getAeneasPos();

				// WARNING: DO NOT SET POS = AENEASPOS;
				updatePos( aeneasPos.x, aeneasPos.y, aeneasPos.angle );
				walkSpeed = getAeneasWalkSpeed();
				ee::consolePrintLine( "Camera.as/ Walkspeed has been set along with position." );
				return true;
			}
			return false;
		}
		// Change these
		else if( name == "Player2" ) {
			if( getPlayer2Pos() != null ) {
				aeneasPos = getPlayer2Pos();

				// WARNING: DO NOT SET POS = AENEASPOS;
				updatePos( aeneasPos.x, aeneasPos.y, aeneasPos.angle );
				walkSpeed = getPlayer2WalkSpeed();
				ee::consolePrintLine( "Camera.as/ Walkspeed has been set along with position." );
				return true;
			}
			return false;
		}
	}

	void updatePos( int x, int y, double angle ) {
		pos.setPos( x, y, angle );
		cameraEntity.setCenter( x, y, 0 );
		aHeadsUp.setPosition(x,y);
	}

	void update( uint32 milliseconds, string name ) {
		// To calculate speed of camera, use x^1.5 per distance, with cap of Aeneas' walkSpeed
		float xDif = ( (float)pos.x ) - aeneasPos.x; //incorrect typecasting?
		float yDif = ( (float)pos.y ) - aeneasPos.y;

		float distance = sqrt( xDif*xDif + yDif*yDif );

		// Arbitrary camera speed (rubber based), complex formula I basically randomly picked
		float cameraSpeed = walkSpeed * pow( distance * 1.25 / walkSpeed, 1.5 );
		if( cameraSpeed > walkSpeed )
			cameraSpeed = walkSpeed;

		float cameraDistance = cameraSpeed * milliseconds / 1000;

		if( xDif != 0)
			pos.angle = 180 / PI * atan( yDif / xDif );
		else if ( xDif == 0 && yDif > 0 )
			pos.angle = 90;
		else
			pos.angle = -90;
		if( xDif < 0 )
			pos.angle += 180;

		updatePos( pos.x + ee::getWindowWidth() / 2,  //incorrect typecasting???
					pos.y + ee::getWindowHeight() / 2, pos.angle );
	}

	void updateHUD() {
		// Changes health bar
		float curHealth = getAeneasStats().getCHealth();
		float maxHealth = getAeneasStats().getMHealth();

		hud.health.setScale( float(curHealth) / maxHealth, getScaleY() ); // Check if first param is float or int
	}
}

shared class HUD 
{
	ee::StaticEntity health("HUD", "health");
	ee::StaticEntity healthFrame("HUD", "healthFrame" );

	ee::StaticEntity healthFlipped("HUD", "healthFlipped");
	ee::StaticEntity healthFrameFlipped("HUD", "healthFrameFlipped" );
	
	HUD()
	{
		health.setPosition(pos.x + ee::getWindowWidth() / 2 + 20, pos.y + ee::getWindowHeight() / 2);
		healthFrame.setPosition( pos.x + ee::getWindowWidth() / 2, pos.y + ee::getWindowHeight() / 2 );

		healthFlipped.setPosition(pos.x + ee::getWindowWidth() / 2 + 400, pos.y + ee::getWindowHeight() / 2);
		healthFrameFlipped.setPosition( pos.x + ee::getWindowWidth() / 2 + 380, pos.y + ee::getWindowHeight() / 2 );

		healthFrameFlipped.setVisible( false );
		healthFlipped.setVisible( false );
	}
	
	void changeToPlayer2HUD() {
		health.setVisible( false );
		healthFrame.setVisible( false );
		healthFlipped.setVisible( true );
		healthFrameFlipped.setVisible( true );
	}
	
	ee::StaticEntity @ getHealth() //error
	{
		return health;
	}
	
	void moveXHUD(int x)
	{
		health.move(x,0);
		objective.move(x,0);
		objective2.move(x,0);
		objective3.move(x,0);
		objective4.move(x,0);
	}
	
	void moveYHUD(int y)
	{
	
		health.move(0,y);
		objective.move(x,0);
		objective2.move(x,0);
		objective3.move(x,0);
		objective4.move(x,0);
	}
	
	void moveXYHUD(int x, int y)
	{
		health.move(x,y);
		objective.move(x,0);
		objective2.move(x,0);
		objective3.move(x,0);
		objective4.move(x,0);
	}
	
	void setPosition(int x, int y)
	{
		health.setPosition(float(x),float(y));
		objective.setPosition(float(x),float(y));
		objective2.setPosition(float(x),float(y));
		objective3.setPosition(float(x),float(y));
		objective4.setPosition(float(x),float(y));
	}
}

