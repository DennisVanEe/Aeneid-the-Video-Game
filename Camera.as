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
import float @ getAeneasWalkSpeed() from "Aeneas.as";

// -------------------------------------------------------------------------------

Camera camera;

void initialize() {
	camera = Camera();
	do { // Makes sure Camera has an actual Aeneas position to focus on
		bool b = camera.setupPosition();
	} while ( !b );
}

void step( uint32 milliseconds ) {
	// To calculate speed of camera, use x^1.5 per distance, with cap of Aeneas' walkSpeed
	camera.update( milliseconds );
}

shared class Camera : Movable {

	private CharPosition pos; // Camera position
	private CharPosition @ aeneasPos; // Aeneas' position; reference, so doesn't need to be updated
	float @ walkSpeed;
	ee::Camera cameraEntity;
	HUD headsUp;

	Camera() {
		Movable();
		pos = CharPosition();
		headsUp = HUD();
		try {
			aeneasPos = getAeneasPos();
		} catch {
			ee::consolePrintLine( "ERROR: Camera.as cannot retrieve Aeneas position." );
			aeneasPos = CharPosition(0, 0, 0);
		}

		cameraEntity.setSize( ee::getWindowWidth(), ee::getWindowHeight() );
	}

	Camera( int x, int y, double angle ) {
		Movable( x, y, angle );
		pos = CharPosition();
		headsUp=HUD();
		try {
			aeneasPos = getAeneasPos();
		} catch {
			ee::consolePrintLine( "ERROR: Camera.as cannot retrieve Aeneas position." );
			aeneasPos = CharPosition(0, 0, 0);
		}

		cameraEntity.setSize( ee::getWindowWidth(), ee::getWindowHeight() );
	}

	bool setupPosition() {
		try { 
			if( getAeneasPos() != null ) {
				aeneasPos = getAeneasPos();

				// WARNING: DO NOT SET POS = AENEASPOS;
				updatePos( aeneasPos.x, aeneasPos.y, aeneasPos.angle );
				walkSpeed = getAeneasWalkSpeed();
				return true;
			}
			return false;
		} catch {
			return false;
		}
	}

	void updatePos( int x, int y, double angle ) {
		pos.setPos( x, y, angle );
		cameraEntity.setCenter( x, y, 0 );
		headsUp.setPosition(x,y);
	}

	void update( uint32 milliseconds ) {
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

		updatePos( centerCamera.x + ee::getWindowWidth() / 2,  //incorrect typecasting???
					centerCamera.y + ee::getWindowHeight() / 2, pos.angle );
	}
}

	class HUD 
{
	ee::StaticEntity health("HUD", "health");
	ee::StaticEntity objective("HUD","objective");
	ee::StaticEntity objective2("HUD","objective2");
	ee::StaticEntity objective3("HUD","objective3");
	ee::StaticEntity objective4("HUD","objective4");
	
	HUD()
	{
		health.setPosition(centerCamera.x + ee::getWindowWidth() / 2, centerCamera.y + ee::getWindowHeight() / 2); 
		objective.setPosition(centerCamera.x + ee::getWindowWidth() / 2, centerCamera.y + ee::getWindowHeight() / 2);
		objective2.setVisible(false);
		objective3.setVisible(false);
		objective4.setVisible(false);
	}
	
	void changeObjective2()
	{
		objective.setVisible(false);
		objective2.setVisible(true);
	}
	
	void changeObjective3
	{
		objective2.setVisible(false);
		objective3.setVisible(true);
	}
	
	void changeObjective4()
	{
		objective3.setVisible(false);
		objective4.setVisible(true);
	}
	void changeHealth()
	{
		health.setScale(0.5,getScaleY());//something about changing the image/sprite of the health bar DENNIS
		//this doesn't change the health statistic, this has to change the animation of the HUD to show visible change
	}
	
	StaticEntity @ getHealth()
	{
		return health;
	}
	
	StaticEntity @ getObjective()
	{
		return objective;
	}
	
	void moveXHUD(int x)
	{
		h.move(x,0);
		o.move(x,0);
	}
	
	void moveYHUD(int y)
	{
	
		h.move(0,y);
		o.move(0,y);
	}
	
	void moveXYHUD(int x, int y)
	{
		h.move(x,y);
		o.move(x,y);
	}
	
	void setPosition(int x, int y)
	{
		h.setPosition(float(x),float(y));
	}
}

