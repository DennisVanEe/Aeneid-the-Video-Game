#include "Movable.as"

shared class Collectible : Movable
{
	private float mass;
	private string name;
	private ee::StaticEntity entity; 

	Collectible( float weight, string n, ee::StaticEntity ent ) 
	{
		Movable();
		mass = weight;
		name = n;
		entity = ent;
	}

	float getMass() const
	{
		ee::consolePrintln( "Collectible.as/getMass: returns the mass of the collectible." );
		return mass;
	}

	string getName() const
	{
		ee::consolePrintln( "Collectible.as/getName: returns the name of the collectible." );
		return name;
	}

	// Sets position of the Collectible on the map
	void setPos( int x, int y, double angle ) 
	{
		ee::consolePrintln( "Collectible.as/setPos: sets the position of the collectible." );
		setPos( x, y, angle ); // Calls Movable setPos
	}
}