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

#include "include/Movable.as"
import CharPosition @ getAeneasPos() from "Aeneas.as";

Camera camera;

void initialize() {
	camera = Camera();
	do { // Makes sure Camera has an actual Aeneas position to focus on
		bool b = camera.setupPosition();
	} while ( !b );
}

shared class Camera : Movable {

	private CharPosition @ pos;

	Camera() {
		Movable();
		try {
			pos = getAeneasPos();
		} catch {
			ee::consolePrintLine( "ERROR: Camera.as cannot retrieve Aeneas position." );
			pos = CharPosition(0, 0, 0);
		}
	}

	Camera( int x, int y, double angle ) {
		Movable( x, y, angle );
		try {
			pos = getAeneasPos();
		} catch {
			ee::consolePrintLine( "ERROR: Camera.as cannot retrieve Aeneas position." );
			pos = CharPosition(0, 0, 0);
		}
	}

	bool setupPosition() {
		try { 
			if( getAeneasPos() != null ) {
				pos = getAeneasPos();
				return true;
			}
			return false;
		} catch {
			return false;
		}
	}

	void updatePos( int x, int y, double angle ) {
		pos.setPos( x, y, angle );
	}
}