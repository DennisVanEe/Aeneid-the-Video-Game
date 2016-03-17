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

	Camera() {
		Movable();
		pos = CharPosition();
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
		cameraEntity.setSensor( x, y, 0 );
	}

	void update( uint32 milliseconds ) {
		// To calculate speed of camera, use x^1.5 per distance, with cap of Aeneas' walkSpeed
		float xDif = ( (float)pos.x ) - aeneasPos.x;
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

		updatePos( pos.x + (int) (cameraDistance * cos( pos.angle ) ), 
					pos.y + (int) (cameraDistance * sin( pos.angle ) ), pos.angle );
	}
}

